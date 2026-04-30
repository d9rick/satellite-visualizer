import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/data/tle/tle_api.dart';
import 'package:flutter_sat/data/tle/tle_parser.dart';
import 'package:flutter_sat/data/tle/tle_repository.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';

final tleRepositoryProvider = Provider<TleRepository>((ref) {
  return TleRepository(api: TleApi(), parser: TleParser());
});

class SelectedGroupNotifier extends Notifier<String> {
  @override
  String build() => AppConstants.defaultTleGroup;

  void select(String group) => state = group;
}

final selectedGroupProvider = NotifierProvider<SelectedGroupNotifier, String>(
  SelectedGroupNotifier.new,
);

final satelliteListProvider = FutureProvider<List<SatelliteEntity>>((
  ref,
) async {
  final repo = ref.watch(tleRepositoryProvider);
  final group = ref.watch(selectedGroupProvider);
  return repo.getSatellites(group);
});

class SelectedSatelliteNotifier extends Notifier<SatelliteEntity?> {
  @override
  SatelliteEntity? build() => null;

  void select(SatelliteEntity? sat) => state = sat;
}

final selectedSatelliteProvider =
    NotifierProvider<SelectedSatelliteNotifier, SatelliteEntity?>(
      SelectedSatelliteNotifier.new,
    );

class HiddenSatellitesNotifier extends Notifier<Set<int>> {
  @override
  Set<int> build() => <int>{};

  void toggle(int noradCatId) {
    if (state.contains(noradCatId)) {
      state = {...state}..remove(noradCatId);
    } else {
      state = {...state, noradCatId};
    }
  }

  void toggleAll(List<SatelliteEntity> satellites, bool visible) {
    if (visible) {
      state = {};
    } else {
      state = satellites.map((s) => s.tle.noradCatId).toSet();
    }
  }
}

final hiddenSatellitesProvider =
    NotifierProvider<HiddenSatellitesNotifier, Set<int>>(
      HiddenSatellitesNotifier.new,
    );
