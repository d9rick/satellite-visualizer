abstract class AppConstants {
  static const String celestrakBaseUrl =
      'https://celestrak.org/NORAD/elements/gp.php';

  static const String defaultTleGroup = 'stations';

  static const String tleFormat = 'tle';

  static const String tleCacheBox = 'tle_cache';

  static const Duration cacheDuration = Duration(hours: 6);

  static const double globeRotationSpeed = 0.02;
}
