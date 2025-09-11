import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gotzmann_app/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgbScreen extends StatefulWidget {
  final bool forceFallback;

  const AgbScreen({super.key, this.forceFallback = false});

  @override
  State<AgbScreen> createState() => _AgbScreenState();
}

class _AgbScreenState extends State<AgbScreen> {
  late final WebViewController _controller;
  bool _showFallback = false;

  @override
  void initState() {
    super.initState();

    if (widget.forceFallback) {
      _showFallback = true;
      return;
    }

    final controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            if (error.isForMainFrame) {
              setState(() {
                _showFallback = true;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(kAgbUrl));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGB, Impressum & Datenschutz'),
      ),
      body: _showFallback
          ? _buildMarkdownFallback(context)
          : WebViewWidget(controller: _controller),
    );
  }

  Widget _buildMarkdownFallback(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString('assets/content/agb.md'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            padding: const EdgeInsets.all(16.0),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Fehler beim Laden der AGBs: ${snapshot.error}'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
