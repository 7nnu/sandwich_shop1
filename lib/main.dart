import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: Text('Welcome to the Sandwich Shop!'),
        ),
      ),
    );
  }
}


void main() {
  runApp(const App());
}

