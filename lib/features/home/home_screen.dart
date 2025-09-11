import 'package:flutter/material.dart';
import '../../widgets/app_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Willkommen bei Gotzmann Photography'),
            ),
          ),
          AppFooter(),
        ],
      ),
    );
  }
}
