import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/data/tle/tle_api.dart';
import 'package:flutter_sat/data/tle/tle_parser.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';

class TleRepository {
  final TleApi _api;
  final TleParser _parser;

  TleRepository({TleApi? api, TleParser? parser})
    : _api = api ?? TleApi(),
      _parser = parser ?? TleParser();

  Future<List<SatelliteEntity>> getSatellites(String group) async {
    final box = await Hive.openBox(AppConstants.tleCacheBox);

    final cacheTimestamp = box.get('${group}_timestamp') as int?;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (cacheTimestamp != null &&
        (now - cacheTimestamp) < AppConstants.cacheDuration.inMilliseconds) {
      final cachedJson = box.get('${group}_data') as String?;
      if (cachedJson != null) {
        try {
          final list = jsonDecode(cachedJson) as List;
          return list
              .map((e) => SatelliteEntity.fromJson(e as Map<String, dynamic>))
              .toList();
        } catch (_) {
          await box.delete('${group}_data');
          await box.delete('${group}_timestamp');
        }
      }
    }

    return _fetchAndCache(group, box, now);
  }

  Future<List<SatelliteEntity>> refreshSatellites(String group) async {
    final box = await Hive.openBox(AppConstants.tleCacheBox);
    await box.delete('${group}_timestamp');
    await box.delete('${group}_data');
    return getSatellites(group);
  }

  Future<List<SatelliteEntity>> _fetchAndCache(
    String group,
    Box<dynamic> box,
    int timestamp,
  ) async {
    final rawText = await _api.fetchTleGroup(group);
    final satellites = _parser.parse(rawText);

    final jsonStr = jsonEncode(satellites.map((s) => s.toJson()).toList());
    await box.put('${group}_data', jsonStr);
    await box.put('${group}_timestamp', timestamp);

    return satellites;
  }
}
