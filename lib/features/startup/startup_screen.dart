// features/startup/startup_screen.dart
import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/crew'),
              child: const Text('Go to Crew Mode'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/product-select'),
              child: const Text('Go to Product Select'),
            ),
          ],
        ),
      ),
    );
  }
}
