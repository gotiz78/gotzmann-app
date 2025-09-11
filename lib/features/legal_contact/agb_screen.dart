import 'package:flutter/material.dart';
import '../../widgets/markdown_page.dart';
class AgbScreen extends StatelessWidget {
  const AgbScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const MarkdownPage(title: 'AGB', assetPath: 'assets/content/agb.md');
}
