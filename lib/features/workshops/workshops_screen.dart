import 'package:flutter/material.dart';

class WorkshopsScreen extends StatelessWidget {
  const WorkshopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshops'),
      ),
      body: const Center(
        child: Text('Workshop-Liste (Platzhalter)'),
      ),
    );
  }
}
