import 'package:flutter/material.dart';
void main() => runApp(const _App());
class _App extends StatelessWidget {
  const _App({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Gotzmann',
    theme: ThemeData.dark(useMaterial3: true),
    home: const Scaffold(body: Center(child: Text('Gotzmann App'))),
  );
}
