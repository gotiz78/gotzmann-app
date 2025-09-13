import 'package:flutter/material.dart';
import 'package:gotzmann_app/router/app_router.dart';
import 'package:gotzmann_app/services/membership_service.dart';
import 'package:gotzmann_app/services/notification_service.dart';
import 'package:gotzmann_app/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init services on startup
  await NotificationService().init();
  await MembershipService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gotzmann App',
      theme: appTheme(),
      routerConfig: appRouter(),
    );
  }
}
