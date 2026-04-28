import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/data/tle/tle_api.dart';
import 'package:flutter_sat/data/tle/tle_parser.dart';
import 'package:flutter_sat/data/tle/tle_repository.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';

final tleRepositoryProvider = Provider<TleRepository>((ref) {
  return TleRepository(
    api: TleApi(),
    parser: TleParser(),
  );
});

class SelectedGroupNotifier extends Notifier<String> {
  @override
  String build() => AppConstants.defaultTleGroup;

  void select(String group) => state = group;
}

final selectedGroupProvider =
    NotifierProvider<SelectedGroupNotifier, String>(SelectedGroupNotifier.new);

final satelliteListProvider =
    FutureProvider<List<SatelliteEntity>>((ref) async {
  final repo = ref.watch(tleRepositoryProvider);
  final group = ref.watch(selectedGroupProvider);
  return repo.getSatellites(group);
});
