import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/state/providers.dart';
import 'package:flutter_sat/ui/widgets/globe_view.dart';
import 'package:flutter_sat/ui/widgets/satellite_drawer.dart';

class GlobeScreen extends ConsumerWidget {
  const GlobeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final satellitesAsync = ref.watch(satelliteListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sat'),
        actions: [
          satellitesAsync.whenOrNull(
                data: (sats) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Chip(
                      avatar: const Icon(Icons.satellite_alt, size: 18),
                      label: Text('${sats.length}'),
                    ),
                  ),
                ),
              ) ??
              const SizedBox.shrink(),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(satelliteListProvider),
            tooltip: 'Refresh TLE data',
          ),
        ],
      ),
      drawer: const SatelliteDrawer(),
      body: satellitesAsync.when(
        data: (sats) => GlobeView(satellites: sats),
        loading: () => const Stack(
          children: [
            GlobeView(),
            Center(child: CircularProgressIndicator()),
          ],
        ),
        error: (_, _) => const GlobeView(),
      ),
    );
  }
}
