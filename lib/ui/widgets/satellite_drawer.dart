import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/state/providers.dart';

class SatelliteDrawer extends ConsumerWidget {
  const SatelliteDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final satellitesAsync = ref.watch(satelliteListProvider);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Satellites',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                satellitesAsync.when(
                  data: (sats) => Text('${sats.length} satellites loaded'),
                  loading: () => const Text('Loading...'),
                  error: (e, _) => Text('Error: $e'),
                ),
              ],
            ),
          ),
          Expanded(
            child: satellitesAsync.when(
              data: (satellites) => ListView.builder(
                itemCount: satellites.length,
                itemBuilder: (context, index) {
                  final sat = satellites[index];
                  return ListTile(
                    leading: const Icon(Icons.satellite_alt),
                    title: Text(sat.name),
                    subtitle: Text('NORAD: ${sat.noradCatId}'),
                    dense: true,
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load satellites:\n$error',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            ref.invalidate(satelliteListProvider),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
