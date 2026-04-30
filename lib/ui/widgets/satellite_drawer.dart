import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/state/providers.dart';
import 'package:flutter_sat/ui/widgets/satellite_search_delegate.dart';

class SatelliteDrawer extends ConsumerWidget {
  const SatelliteDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final satellitesAsync = ref.watch(satelliteListProvider);
    final hiddenSatellites = ref.watch(hiddenSatellitesProvider);
    final selectedGroup = ref.watch(selectedGroupProvider);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Satellites',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (satellitesAsync.hasValue)
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () async {
                          final sat = await showSearch(
                            context: context,
                            delegate: SatelliteSearchDelegate(
                              satellites: satellitesAsync.value!,
                            ),
                          );
                          if (sat != null && context.mounted) {
                            final hidden = ref.read(hiddenSatellitesProvider);
                            if (hidden.contains(sat.tle.noradCatId)) {
                              ref
                                  .read(hiddenSatellitesProvider.notifier)
                                  .toggle(sat.tle.noradCatId);
                            }
                            // Close drawer
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedGroup,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Group',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: AppConstants.tleGroups
                      .map(
                        (group) => DropdownMenuItem(
                          value: group.group,
                          child: Text(group.label),
                        ),
                      )
                      .toList(),
                  onChanged: (group) {
                    if (group == null) return;
                    ref.read(selectedGroupProvider.notifier).select(group);
                  },
                ),
                const SizedBox(height: 8),
                satellitesAsync.when(
                  data: (sats) {
                    final hiddenCount = sats
                        .where((sat) => hiddenSatellites.contains(
                              sat.tle.noradCatId,
                            ))
                        .length;
                    final visibleCount = sats.length - hiddenCount;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$visibleCount / ${sats.length} visible'),
                        TextButton(
                          onPressed: () {
                            final allHidden = hiddenCount == sats.length;
                            ref
                                .read(hiddenSatellitesProvider.notifier)
                                .toggleAll(sats, allHidden);
                          },
                          child: Text(
                            hiddenCount == sats.length
                                ? 'Show All'
                                : 'Hide All',
                          ),
                        ),
                      ],
                    );
                  },
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
                  final isHidden = hiddenSatellites.contains(
                    sat.tle.noradCatId,
                  );

                  return ListTile(
                    leading: const Icon(Icons.satellite_alt),
                    title: Text(sat.label),
                    subtitle: Text('NORAD: ${sat.tle.noradCatId}'),
                    dense: true,
                    trailing: Switch(
                      value: !isHidden,
                      onChanged: (bool value) {
                        ref
                            .read(hiddenSatellitesProvider.notifier)
                            .toggle(sat.tle.noradCatId);
                      },
                    ),
                    onTap: () {
                      ref
                          .read(hiddenSatellitesProvider.notifier)
                          .toggle(sat.tle.noradCatId);
                    },
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
                        onPressed: () => ref.invalidate(satelliteListProvider),
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
