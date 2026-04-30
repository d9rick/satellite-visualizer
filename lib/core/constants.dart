abstract class AppConstants {
  static const String celestrakBaseUrl =
      'https://celestrak.org/NORAD/elements/gp.php';

  static const String defaultTleGroup = 'stations';

  static const List<TleGroupOption> tleGroups = [
    TleGroupOption('stations', 'Space Stations'),
    TleGroupOption('active', 'Active Satellites'),
    TleGroupOption('visual', 'Visible Satellites'),
    TleGroupOption('starlink', 'Starlink'),
    TleGroupOption('oneweb', 'OneWeb'),
    TleGroupOption('gps-ops', 'GPS Operational'),
    TleGroupOption('glo-ops', 'GLONASS Operational'),
    TleGroupOption('galileo', 'Galileo'),
    TleGroupOption('beidou', 'Beidou'),
    TleGroupOption('geo', 'Geostationary'),
    TleGroupOption('weather', 'Weather'),
    TleGroupOption('noaa', 'NOAA'),
    TleGroupOption('goes', 'GOES'),
    TleGroupOption('planet', 'Planet'),
    TleGroupOption('amateur', 'Amateur Radio'),
    TleGroupOption('science', 'Science'),
    TleGroupOption('military', 'Military'),
  ];

  static const String tleFormat = 'tle';

  static const String tleCacheBox = 'tle_cache';

  static const String satelliteSettingsBox = 'satellite_settings';

  static const String selectedGroupKey = 'selected_group';

  static String hiddenSatellitesKey(String group) => 'hidden_satellites_$group';

  static const Duration cacheDuration = Duration(hours: 6);

  static const double globeRotationSpeed = 0.02;
}

class TleGroupOption {
  final String group;
  final String label;

  const TleGroupOption(this.group, this.label);
}
