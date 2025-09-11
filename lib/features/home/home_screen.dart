import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotzmann_app/theme/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Björn Götzmann',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spacing8),
            Text(
              'Photography & Art',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spacing24 * 2),
            ElevatedButton(
              onPressed: () => context.go('/gallery'),
              child: const Text('Galerie'),
            ),
            const SizedBox(height: spacing16),
            ElevatedButton(
              onPressed: () => context.go('/booking'),
              child: const Text('Buchen'),
            ),
            const SizedBox(height: spacing16),
            ElevatedButton(
              onPressed: () => context.go('/workshops'),
              child: const Text('Workshops'),
            ),
          ],
        ),
      ),
    );
  }
}
