// lib/pages/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (title: Text("Portfolio ")),
      body: Center(child: Text("Willkommen im Portfolio von Ujjwal Kathet")),
    );
  }
}
