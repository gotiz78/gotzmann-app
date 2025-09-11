import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownPage extends StatelessWidget {
  final String title;
  final String assetPath;
  const MarkdownPage({super.key, required this.title, required this.assetPath});

  Future<String> _loadMd() async {
    try {
      return await rootBundle.loadString(assetPath);
    } catch (_) {
      return '# Inhalt nicht gefunden\\n\\nDie Datei **$assetPath** konnte nicht geladen werden.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<String>(
        future: _loadMd(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          return Markdown(data: snap.data!, padding: const EdgeInsets.all(16));
        },
      ),
    );
  }
}
