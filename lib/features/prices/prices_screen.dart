import 'package:flutter/material.dart';
import '../../widgets/markdown_page.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const MarkdownPage(title: 'Preise', assetPath: 'assets/content/preise.md');
}
