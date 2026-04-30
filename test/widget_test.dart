import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/app/app.dart';
import 'package:flutter_sat/core/constants.dart';
import 'package:flutter_sat/state/providers.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late Directory hiveDirectory;

  setUpAll(() async {
    hiveDirectory = await Directory.systemTemp.createTemp('flutter_sat_test_');
    Hive.init(hiveDirectory.path);
  });

  setUp(() async {
    await Hive.openBox(AppConstants.satelliteSettingsBox);
  });

  tearDown(() async {
    await Hive.box(AppConstants.satelliteSettingsBox).clear();
    await Hive.close();
  });

  tearDownAll(() async {
    await hiveDirectory.delete(recursive: true);
  });

  testWidgets('App renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          satelliteListProvider.overrideWith((ref) async => []),
        ],
        child: const SatApp(),
      ),
    );

    expect(find.text('Space Stations: 0'), findsOneWidget);
  });
}
