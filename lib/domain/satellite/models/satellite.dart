import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_sat/domain/satellite/models/tle.dart';

part 'satellite.freezed.dart';
part 'satellite.g.dart';

@freezed
abstract class SatelliteEntity with _$SatelliteEntity {
  const factory SatelliteEntity({required String label, required Tle tle}) =
      _SatelliteEntity;

  factory SatelliteEntity.fromJson(Map<String, dynamic> json) =>
      _$SatelliteEntityFromJson(json);
}
