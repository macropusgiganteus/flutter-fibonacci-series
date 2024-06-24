import 'package:fibonacci_series/fibonacci_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FibonacciList(
          n: 50,
        ),
      ),
    );
  }
}
