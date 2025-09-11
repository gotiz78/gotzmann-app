import 'package:flutter/material.dart';
import 'package:gotzmann_app/router/app_router.dart';
import 'package:gotzmann_app/theme/theme.dart';

void main() {
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
