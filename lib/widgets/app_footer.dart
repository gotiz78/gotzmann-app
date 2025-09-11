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
          // TODO: Uncomment when assets/branding/HP-300x300.png is available.
          // Image.asset(
          //   'assets/branding/HP-300x300.png',
          //   height: 48,
          // ),
          const SizedBox(height: 12),
          Text('Gotzmann Photography',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'Ahornweg 7 – CH-2555 Brügg : Studio\n'
            'Alte Lyss-Strasse 12 – CH-3270 Aarberg (3. Etage / Attika)\n'
            'Es sind genügend Besucherparkplätze vorhanden.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Für alle anderen Anliegen bitte um Terminvereinbarung:\n'
            '+41 76 559 00 95 – info@gotzmann.ch',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
