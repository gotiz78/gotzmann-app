import 'package:flutter/material.dart';
import 'package:gotzmann_app/config/site.dart';
import 'package:gotzmann_app/widgets/markdown_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgbScreen extends StatefulWidget {
  const AgbScreen({super.key});

  @override
  State<AgbScreen> createState() => _AgbScreenState();
}

class _AgbScreenState extends State<AgbScreen> {
  late final WebViewController _controller;
  bool _showFallback = false;

  @override
  void initState() {
    super.initState();

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
    return _showFallback
        ? const MarkdownPage(
            title: 'AGB (Offline-Version)',
            assetPath: 'assets/content/agb.md',
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('AGB'),
            ),
            body: WebViewWidget(controller: _controller),
          );
  }
}
