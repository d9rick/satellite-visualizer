// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tle _$TleFromJson(Map<String, dynamic> json) => _Tle(
  name: json['name'] as String,
  line1: json['line1'] as String,
  line2: json['line2'] as String,
  noradCatId: (json['noradCatId'] as num).toInt(),
  intlDesignator: json['intlDesignator'] as String,
  epochYear: (json['epochYear'] as num).toDouble(),
  inclination: (json['inclination'] as num).toDouble(),
  raan: (json['raan'] as num).toDouble(),
  eccentricity: (json['eccentricity'] as num).toDouble(),
  argumentOfPerigee: (json['argumentOfPerigee'] as num).toDouble(),
  meanAnomaly: (json['meanAnomaly'] as num).toDouble(),
  meanMotion: (json['meanMotion'] as num).toDouble(),
);

Map<String, dynamic> _$TleToJson(_Tle instance) => <String, dynamic>{
  'name': instance.name,
  'line1': instance.line1,
  'line2': instance.line2,
  'noradCatId': instance.noradCatId,
  'intlDesignator': instance.intlDesignator,
  'epochYear': instance.epochYear,
  'inclination': instance.inclination,
  'raan': instance.raan,
  'eccentricity': instance.eccentricity,
  'argumentOfPerigee': instance.argumentOfPerigee,
  'meanAnomaly': instance.meanAnomaly,
  'meanMotion': instance.meanMotion,
};
