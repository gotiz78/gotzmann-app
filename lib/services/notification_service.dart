import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kPrefNotificationsEnabled = 'notifications_enabled';

class NotificationService {
  static final NotificationService _i = NotificationService._();
  NotificationService._();
  factory NotificationService() => _i;

  bool _enabledCache = false;
  bool get isEnabled => _enabledCache;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _enabledCache = prefs.getBool(_kPrefNotificationsEnabled) ?? false;
  }

  Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    _enabledCache = value;
    await prefs.setBool(_kPrefNotificationsEnabled, value);
    if (value) {
      // Hier später: echte Registrierung/Permissions
      debugPrint('Notifications enabled (stub)');
    } else {
      // Hier später: Abmelden vom Push-Dienst
      debugPrint('Notifications disabled (stub)');
    }
  }
}
