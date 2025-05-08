import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: const Center(
        child: Text('Willkommen im Portfolio von Ujjwal Kathet'),
      ),
    );
  }
}
