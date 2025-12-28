import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';

// Provider for the StorageService
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

class StorageService {
  late Box _settingsBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox(AppConstants.kSettingsBox);
    debugPrint('Hive Initialized. Settings Box Opened.');
  }

  // Getters
  bool get isDarkMode => _settingsBox.get(AppConstants.kIsDarkMode, defaultValue: true);
  int get accentColorValue => _settingsBox.get(AppConstants.kAccentColor, defaultValue: 0xFF7C3AED); // Default Electric Violet
  bool get isHighQualityAudio => _settingsBox.get(AppConstants.kIsHighQualityAudio, defaultValue: true);

  // Setters
  Future<void> setDarkMode(bool value) async {
    await _settingsBox.put(AppConstants.kIsDarkMode, value);
  }

  Future<void> setAccentColor(int colorValue) async {
    await _settingsBox.put(AppConstants.kAccentColor, colorValue);
  }

  Future<void> setHighQualityAudio(bool value) async {
    await _settingsBox.put(AppConstants.kIsHighQualityAudio, value);
  }
}
