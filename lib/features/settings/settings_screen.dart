import 'package:flutter/material.dart';
import 'package:gotzmann_app/config/flags.dart';
import 'package:gotzmann_app/services/notification_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _loading = true;
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    NotificationService().init().then((_) {
      if (!mounted) return;
      setState(() {
        _enabled = NotificationService().isEnabled;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                SwitchListTile(
                  title: const Text('Benachrichtigungen'),
                  subtitle: Text(kEnableNotifications
                      ? 'Aktiviere/Deaktiviere Push-Benachrichtigungen.'
                      : 'Benachrichtigungen sind noch nicht technisch verbunden (später aktivierbar).'),
                  value: _enabled,
                  onChanged: (val) async {
                    await NotificationService().setEnabled(val);
                    if (!mounted) return;
                    setState(() => _enabled = val);
                    if (kEnableNotifications && val) {
                      // TODO: Permissions/Registrierung für iOS/Android/Web
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Benachrichtigungen aktiviert (Stub)')),
                      );
                    }
                  },
                ),
              ],
            ),
    );
  }
}
