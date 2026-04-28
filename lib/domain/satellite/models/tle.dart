import 'package:freezed_annotation/freezed_annotation.dart';

part 'tle.freezed.dart';
part 'tle.g.dart';

@freezed
abstract class Tle with _$Tle {
  const factory Tle({
    required String name,
    required String line1,
    required String line2,
    required int noradCatId,
    required String intlDesignator,
    required double epochYear,
    required double inclination,
    required double raan,
    required double eccentricity,
    required double argumentOfPerigee,
    required double meanAnomaly,
    required double meanMotion,
  }) = _Tle;

  factory Tle.fromJson(Map<String, dynamic> json) => _$TleFromJson(json);
}
