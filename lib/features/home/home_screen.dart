import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Willkommen bei Gotzmann Photography'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/prices'),
                    child: const Text('Preise ansehen'),
                  )
                ],
              ),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
