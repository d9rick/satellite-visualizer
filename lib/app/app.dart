import 'package:flutter/material.dart';
import 'package:flutter_sat/app/theme.dart';
import 'package:flutter_sat/ui/screens/globe_screen.dart';

class SatApp extends StatelessWidget {
  const SatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sat',
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const GlobeScreen(),
    );
  }
}
