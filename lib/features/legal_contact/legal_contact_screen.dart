import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotzmann_app/constants.dart';
import 'package:gotzmann_app/theme/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalContactScreen extends StatelessWidget {
  const LegalContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // TODO: show error to user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt & Rechtliches'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: spacing16),
            ElevatedButton.icon(
              icon: const Icon(Icons.mail_outline),
              label: const Text('E-Mail an info@gotzmann.ch'),
              onPressed: () => _launchUrl('mailto:$kEmail'),
            ),
            const SizedBox(height: spacing16),
            ElevatedButton.icon(
              icon: const Icon(Icons.euro_symbol),
              label: const Text('Preise ansehen'),
              onPressed: () => _launchUrl(kPricesUrl),
            ),
            const SizedBox(height: spacing16),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Folge mir auf Instagram'),
              onPressed: () => _launchUrl(kIgProfileUrl),
            ),
            const Divider(height: spacing24 * 2),
            OutlinedButton(
              onPressed: () => context.go('/legal/agb'),
              child: const Text('AGB, Impressum & Datenschutz'),
            ),
            const Spacer(),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Einstellungen'),
              onPressed: () => context.go('/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
