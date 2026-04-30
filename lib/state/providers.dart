import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/data/tle/tle_api.dart';
import 'package:flutter_sat/data/tle/tle_parser.dart';
import 'package:flutter_sat/data/tle/tle_repository.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';
import 'package:hive_flutter/hive_flutter.dart';

final tleRepositoryProvider = Provider<TleRepository>((ref) {
  return TleRepository(api: TleApi(), parser: TleParser());
});

class SelectedGroupNotifier extends Notifier<String> {
  @override
  String build() {
    final savedGroup = _settingsBox.get(AppConstants.selectedGroupKey) as String?;
    final knownGroups = AppConstants.tleGroups.map((option) => option.group);
    if (savedGroup != null && knownGroups.contains(savedGroup)) {
      return savedGroup;
    }
    return AppConstants.defaultTleGroup;
  }

  Box<dynamic> get _settingsBox => Hive.box(AppConstants.satelliteSettingsBox);

  Future<void> select(String group) async {
    if (state == group) return;
    state = group;
    await _settingsBox.put(AppConstants.selectedGroupKey, group);
  }
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
  Set<int> build() {
    final group = ref.watch(selectedGroupProvider);
    return _loadHiddenSatellites(group);
  }

  Box<dynamic> get _settingsBox => Hive.box(AppConstants.satelliteSettingsBox);

  Future<void> toggle(int noradCatId) async {
    if (state.contains(noradCatId)) {
      state = {...state}..remove(noradCatId);
    } else {
      state = {...state, noradCatId};
    }
    await _saveHiddenSatellites();
  }

  Future<void> toggleAll(List<SatelliteEntity> satellites, bool visible) async {
    if (visible) {
      state = {};
    } else {
      state = satellites.map((s) => s.tle.noradCatId).toSet();
    }
    await _saveHiddenSatellites();
  }

  Set<int> _loadHiddenSatellites(String group) {
    final savedIds = _settingsBox.get(AppConstants.hiddenSatellitesKey(group));
    if (savedIds is Iterable) {
      return savedIds.whereType<int>().toSet();
    }
    return <int>{};
  }

  Future<void> _saveHiddenSatellites() async {
    final group = ref.read(selectedGroupProvider);
    await _settingsBox.put(
      AppConstants.hiddenSatellitesKey(group),
      state.toList()..sort(),
    );
  }
}

final hiddenSatellitesProvider =
    NotifierProvider<HiddenSatellitesNotifier, Set<int>>(
      HiddenSatellitesNotifier.new,
    );
