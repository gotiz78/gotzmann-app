import 'package:flutter/material.dart';
import 'package:gotzmann_app/config/site.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({super.key});

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
        title: const Text('Instagram'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Folge mir auf Instagram für die neuesten Bilder.'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Auf Instagram öffnen'),
              onPressed: () => _launchUrl(kIgProfileUrl),
            ),
          ],
        ),
      ),
    );
  }
}
