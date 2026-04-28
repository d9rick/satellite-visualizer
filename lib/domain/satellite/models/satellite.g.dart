// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satellite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SatelliteEntity _$SatelliteEntityFromJson(Map<String, dynamic> json) =>
    _SatelliteEntity(
      noradCatId: (json['noradCatId'] as num).toInt(),
      name: json['name'] as String,
      tle: Tle.fromJson(json['tle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SatelliteEntityToJson(_SatelliteEntity instance) =>
    <String, dynamic>{
      'noradCatId': instance.noradCatId,
      'name': instance.name,
      'tle': instance.tle,
    };
