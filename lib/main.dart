// main.dart
import 'package:flutter/material.dart';
import 'screens/calculator.dart';

void main() {
  runApp(const CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const CalculatorScreen(),
    );
  }
}