import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Falls die Datei existiert, anzeigen; ansonsten diesen Block weglassen.
          Image.asset(
            'assets/branding/HP-300x300.png',
            height: 48,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 12),
          Text('Gotzmann Photography',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'Geschäftsadresse: Ahornweg 7 – CH-2555 Brügg\n'
            'Studio: Alte Lyss-Strasse 12 – CH-3270 Aarberg (3. Etage / Attika)\n'
            'Es sind genügend Besucherparkplätze vorhanden.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Kontakt: +41 76 559 00 95 – info@gotzmann.ch',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
