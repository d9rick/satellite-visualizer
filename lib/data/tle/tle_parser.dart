import 'package:flutter_sat/domain/satellite/models/satellite.dart';
import 'package:flutter_sat/domain/satellite/models/tle.dart';

class TleParser {
  List<SatelliteEntity> parse(String rawText) {
    final lines = rawText
        .split('\n')
        .map((l) => l.trimRight())
        .where((l) => l.isNotEmpty)
        .toList();

    final results = <SatelliteEntity>[];

    for (int i = 0; i + 2 < lines.length; i += 3) {
      final nameLine = lines[i].trim();
      final line1 = lines[i + 1];
      final line2 = lines[i + 2];

      if (!line1.startsWith('1 ') || !line2.startsWith('2 ')) {
        continue;
      }

      try {
        results.add(_parseTleEntry(nameLine, line1, line2));
      } catch (_) {
        // Skip malformed entries
      }
    }

    return results;
  }

  SatelliteEntity _parseTleEntry(String name, String line1, String line2) {
    final noradCatId = int.parse(line1.substring(2, 7).trim());
    final intlDesignator = line1.substring(9, 17).trim();
    final epochYear = double.parse(line1.substring(18, 32).trim());
    final inclination = double.parse(line2.substring(8, 16).trim());
    final raan = double.parse(line2.substring(17, 25).trim());
    final eccentricityStr = line2.substring(26, 33).trim();
    final eccentricity = double.parse('0.$eccentricityStr');
    final argumentOfPerigee = double.parse(line2.substring(34, 42).trim());
    final meanAnomaly = double.parse(line2.substring(43, 51).trim());
    final meanMotion = double.parse(line2.substring(52, 63).trim());

    final tle = Tle(
      name: name,
      line1: line1,
      line2: line2,
      noradCatId: noradCatId,
      intlDesignator: intlDesignator,
      epochYear: epochYear,
      inclination: inclination,
      raan: raan,
      eccentricity: eccentricity,
      argumentOfPerigee: argumentOfPerigee,
      meanAnomaly: meanAnomaly,
      meanMotion: meanMotion,
    );

    return SatelliteEntity(label: name, tle: tle);
  }
}
