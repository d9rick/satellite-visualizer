import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/satellite.dart' as globe;
import 'package:flutter_earth_globe/point.dart' as globe_point;
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';
import 'package:flutter_sat/state/providers.dart';
import 'package:flutter_sat/ui/widgets/satellite_info_dialog.dart';

class GlobeView extends ConsumerStatefulWidget {
  final List<SatelliteEntity> satellites;

  const GlobeView({super.key, this.satellites = const []});

  @override
  ConsumerState<GlobeView> createState() => _GlobeViewState();
}

class _GlobeViewState extends ConsumerState<GlobeView>
    with SingleTickerProviderStateMixin {
  static const Duration _satelliteUpdateInterval = Duration(milliseconds: 250);
  static const double _degreesToRadians = math.pi / 180;
  static const double _radiansToDegrees = 180 / math.pi;

  late final FlutterEarthGlobeController _controller;
  bool _isRotating = false;
  bool _showGrid = false;

  late Ticker _ticker;
  Duration _lastSatelliteUpdate = Duration.zero;
  final List<_SatelliteOrbit> _activeSatellites = [];

  // Calculate GMST at given time to sync Earth's rotation frame with celestial RAAN
  double _calculateGMST(DateTime date) {
    final double jd = date.millisecondsSinceEpoch / 86400000.0 + 2440587.5;
    final double d = jd - 2451545.0;
    return (280.46061837 + 360.98564736629 * d) % 360.0;
  }

  @override
  void initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
      rotationSpeed: 0.0,
      isRotating: true, // Always run ticker for satellite animation
      zoom: 0.3,
      isBackgroundFollowingSphereRotation: true,
      background: const AssetImage('assets/2k_stars.jpg'),
      surface: const AssetImage('assets/2k_earth_day.jpg'),
    );

    _ticker = createTicker((elapsed) {
      if (!mounted) return;
      if (elapsed - _lastSatelliteUpdate < _satelliteUpdateInterval) return;
      _lastSatelliteUpdate = elapsed;
      _updateSatellitePositions();
    });

    _controller.onLoaded = () {
      if (mounted) {
        _addSatellites(widget.satellites, ref.read(hiddenSatellitesProvider));
        _ticker.start();
      }
    };
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateSatellitePositions() {
    final now = DateTime.now().toUtc();
    final gmst = _calculateGMST(now);

    for (final sat in _activeSatellites) {
      final elapsedMs = now.millisecondsSinceEpoch - sat.epochMs;
      final phaseRad =
          sat.meanAnomalyRad + (2 * math.pi * elapsedMs / sat.periodMs);
      final u = phaseRad + sat.argumentOfPerigeeRad;

      final latitude =
          math.asin(sat.sinInclination * math.sin(u)) * _radiansToDegrees;

      double longitude =
          (sat.raanRad +
                      math.atan2(
                        sat.cosInclination * math.sin(u),
                        math.cos(u),
                      )) *
                  _radiansToDegrees -
              gmst;

      longitude = longitude % 360;
      if (longitude > 180) longitude -= 360;

      _controller.updateSatellite(
        sat.id,
        coordinates: GlobeCoordinates(latitude, longitude),
      );
    }
  }

  @override
  void didUpdateWidget(GlobeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.satellites != widget.satellites) {
      _controller.clearSatellites();
      _addSatellites(widget.satellites, ref.read(hiddenSatellitesProvider));
    }
  }

  void _addSatellites(List<SatelliteEntity> satellites, Set<int> hiddenIds) {
    _activeSatellites.clear();
    final showLabels = satellites.length <= 250;
    for (final sat in satellites) {
      if (hiddenIds.contains(sat.tle.noradCatId)) continue;
      final orbit = _SatelliteOrbit.fromSatellite(sat);
      if (orbit == null) continue;
      _activeSatellites.add(orbit);

      _controller.addSatellite(
        globe.Satellite(
          id: orbit.id,
          coordinates: const GlobeCoordinates(
            0,
            0,
          ), // Will be instantly updated by ticker
          orbit: null, // Turn off built-in rotation bug
          altitude: 0.045,
          label: showLabels ? sat.label : '',
          style: const globe.SatelliteStyle(
            size: 1.8,
            color: Color(0xCC80FFE8),
            shape: globe.SatelliteShape.circle,
          ),
          onTap: () {
            ref.read(selectedSatelliteProvider.notifier).select(sat);
            showDialog(
              context: context,
              builder: (context) => const SatelliteInfoDialog(),
            );
          },
        ),
      );
    }
    _updateSatellitePositions();
  }

  void _toggleRotation() {
    setState(() {
      _isRotating = !_isRotating;
      _controller.setRotationSpeed(
        _isRotating ? AppConstants.globeRotationSpeed : 0.0,
      );
    });
  }

  void _toggleGrid() {
    setState(() {
      _showGrid = !_showGrid;
      if (_showGrid) {
        // Draw latitude and longitude grids
        for (int lon = -180; lon <= 180; lon += 10) {
          for (int lat = -90; lat <= 90; lat += 10) {
            // We want to skip drawing points where prime or equator lines exist
            if (lon == 0 || lat == 0) continue;

            _controller.addPoint(
              globe_point.Point(
                id: 'grid_${lat}_$lon',
                coordinates: GlobeCoordinates(lat.toDouble(), lon.toDouble()),
                style: const globe_point.PointStyle(
                  size: 2,
                  color: Colors.white54,
                ),
              ),
            );
          }
        }
        // Highlight Prime Meridian and Equator
        for (int lat = -90; lat <= 90; lat += 2) {
          _controller.addPoint(
            globe_point.Point(
              id: 'grid_prime_$lat',
              coordinates: GlobeCoordinates(lat.toDouble(), 0),
              style: const globe_point.PointStyle(
                size: 3,
                color: Colors.redAccent,
              ),
            ),
          );
        }
        for (int lon = -180; lon <= 180; lon += 2) {
          _controller.addPoint(
            globe_point.Point(
              id: 'grid_equator_$lon',
              coordinates: GlobeCoordinates(0, lon.toDouble()),
              style: const globe_point.PointStyle(
                size: 3,
                color: Colors.blueAccent,
              ),
            ),
          );
        }
      } else {
        // Remove all grid points
        final gridPoints = _controller.points
            .where((p) => p.id.startsWith('grid_'))
            .toList();
        for (var p in gridPoints) {
          _controller.removePoint(p.id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<Set<int>>(hiddenSatellitesProvider, (previous, next) {
      if (previous != next) {
        _controller.clearSatellites();
        _addSatellites(widget.satellites, next);
      }
    });

    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final radius = (constraints.biggest.shortestSide / 2) * 0.85;
            return Center(
              child: Listener(
                onPointerDown: (_) {
                  if (_isRotating) {
                    _toggleRotation();
                  }
                },
                child: FlutterEarthGlobe(
                  controller: _controller,
                  radius: radius,
                ),
              ),
            );
          },
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton.small(
                onPressed: _toggleGrid,
                tooltip: _showGrid ? 'Hide Grid' : 'Show Grid',
                child: Icon(_showGrid ? Icons.grid_off : Icons.grid_on),
              ),
              const SizedBox(height: 8),
              FloatingActionButton.small(
                onPressed: _toggleRotation,
                tooltip: _isRotating ? 'Stop rotation' : 'Start rotation',
                child: Icon(_isRotating ? Icons.pause : Icons.play_arrow),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SatelliteOrbit {
  final String id;
  final int epochMs;
  final double periodMs;
  final double meanAnomalyRad;
  final double sinInclination;
  final double cosInclination;
  final double raanRad;
  final double argumentOfPerigeeRad;

  const _SatelliteOrbit({
    required this.id,
    required this.epochMs,
    required this.periodMs,
    required this.meanAnomalyRad,
    required this.sinInclination,
    required this.cosInclination,
    required this.raanRad,
    required this.argumentOfPerigeeRad,
  });

  static _SatelliteOrbit? fromSatellite(SatelliteEntity satellite) {
    final tle = satellite.tle;
    if (tle.meanMotion <= 0) return null;

    final yy = (tle.epochYear / 1000).floor();
    final year = yy < 57 ? 2000 + yy : 1900 + yy;
    final days = tle.epochYear - (yy * 1000);
    final daysInt = days.floor();
    final fraction = days - daysInt;
    final epochTime = DateTime.utc(year, 1, 1).add(
      Duration(
        days: daysInt - 1,
        microseconds: (fraction * 24 * 60 * 60 * 1000000).round(),
      ),
    );
    final inclinationRad =
        tle.inclination * _GlobeViewState._degreesToRadians;

    return _SatelliteOrbit(
      id: tle.noradCatId.toString(),
      epochMs: epochTime.millisecondsSinceEpoch,
      periodMs: 86400000.0 / tle.meanMotion,
      meanAnomalyRad: tle.meanAnomaly * _GlobeViewState._degreesToRadians,
      sinInclination: math.sin(inclinationRad),
      cosInclination: math.cos(inclinationRad),
      raanRad: tle.raan * _GlobeViewState._degreesToRadians,
      argumentOfPerigeeRad:
          tle.argumentOfPerigee * _GlobeViewState._degreesToRadians,
    );
  }
}
