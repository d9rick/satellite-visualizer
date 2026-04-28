import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/satellite.dart' as globe;
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';

class GlobeView extends StatefulWidget {
  final List<SatelliteEntity> satellites;
  final ValueChanged<SatelliteEntity>? onSatelliteTapped;

  const GlobeView({
    super.key,
    this.satellites = const [],
    this.onSatelliteTapped,
  });

  @override
  State<GlobeView> createState() => _GlobeViewState();
}

class _GlobeViewState extends State<GlobeView> {
  late final FlutterEarthGlobeController _controller;
  bool _isRotating = false;

  @override
  void initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
      rotationSpeed: AppConstants.globeRotationSpeed,
      isRotating: false,
      zoom: 0.3,
      isBackgroundFollowingSphereRotation: true,
      background: const AssetImage('assets/2k_stars.jpg'),
      surface: const AssetImage('assets/2k_earth_day.jpg'),
    );
    _controller.onLoaded = () {
      _addSatellites(widget.satellites);
    };
  }

  @override
  void didUpdateWidget(GlobeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.satellites != widget.satellites) {
      _controller.clearSatellites();
      _addSatellites(widget.satellites);
    }
  }

  void _addSatellites(List<SatelliteEntity> satellites) {
    for (final sat in satellites) {
      final tle = sat.tle;
      // Mean motion is revs/day -> period in seconds = 86400 / meanMotion
      final periodSeconds =
          tle.meanMotion > 0 ? (86400.0 / tle.meanMotion) : 5400.0;

      _controller.addSatellite(globe.Satellite(
        id: sat.noradCatId.toString(),
        coordinates: const GlobeCoordinates(0, 0),
        altitude: 0.06,
        label: sat.name,
        orbit: globe.SatelliteOrbit(
          inclination: tle.inclination,
          raan: tle.raan,
          period: Duration(seconds: periodSeconds.round()),
          eccentricity: tle.eccentricity,
          argumentOfPeriapsis: tle.argumentOfPerigee,
          initialPhase: tle.meanAnomaly,
        ),
        style: const globe.SatelliteStyle(
          size: 3,
          color: Colors.greenAccent,
          shape: globe.SatelliteShape.circle,
        ),
        onTap: () => widget.onSatelliteTapped?.call(sat),
      ));
    }
  }

  void _toggleRotation() {
    _controller.toggleRotation();
    setState(() => _isRotating = _controller.isRotating);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final radius = (constraints.biggest.shortestSide / 2) * 0.85;
            return Center(
              child: Listener(
                onPointerDown: (_) {
                  if (_controller.isRotating) {
                    _controller.stopRotation();
                    setState(() => _isRotating = false);
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
          child: FloatingActionButton.small(
            onPressed: _toggleRotation,
            tooltip: _isRotating ? 'Stop rotation' : 'Start rotation',
            child: Icon(_isRotating ? Icons.pause : Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}
