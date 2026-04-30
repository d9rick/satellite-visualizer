import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_sat/app/app.dart';
import 'package:flutter_sat/core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.satelliteSettingsBox);

  runApp(
    const ProviderScope(
      child: SatApp(),
    ),
  );
}
