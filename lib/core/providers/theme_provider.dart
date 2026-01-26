import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_calculateThemeMode()) {
    // Check every 10 minutes to see if we need to switch themes
    _timer = Timer.periodic(const Duration(minutes: 10), (_) => updateTheme());
  }

  late final Timer _timer;

  static ThemeMode _calculateThemeMode() {
    final now = DateTime.now();
    final hour = now.hour;
    // Light between 6 AM and 6 PM
    if (hour >= 6 && hour < 18) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void updateTheme() {
    final newMode = _calculateThemeMode();
    if (state != newMode) {
      state = newMode;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
