// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satellite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SatelliteEntity _$SatelliteEntityFromJson(Map<String, dynamic> json) =>
    _SatelliteEntity(
      label: json['label'] as String,
      tle: Tle.fromJson(json['tle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SatelliteEntityToJson(_SatelliteEntity instance) =>
    <String, dynamic>{'label': instance.label, 'tle': instance.tle};
