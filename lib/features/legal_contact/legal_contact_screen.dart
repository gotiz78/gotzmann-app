import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LegalContactScreen extends StatelessWidget {
  const LegalContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt & Rechtliches'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('AGB'),
            subtitle: const Text('Allgemeine Geschäftsbedingungen'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/legal/agb'),
          ),
        ],
      ),
    );
  }
}
