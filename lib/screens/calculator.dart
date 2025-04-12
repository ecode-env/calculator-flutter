// screens/calculator.dart
import 'package:flutter/material.dart';
import '../utils/calculator_logic.dart';
import '../widgets/button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  final CalculatorLogic _calculatorLogic = CalculatorLogic();

  void _onButtonPressed(String buttonText) {
    setState(() {
      _display = _calculatorLogic.processInput(buttonText);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              alignment: Alignment.bottomRight,
              child: Text(
                _display,
                style: TextStyle(
                  fontSize: screenWidth * 0.12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: screenHeight * 0.5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
              ),
              itemCount: 18,
              itemBuilder: (context, index) {
                final buttonData = [
                  {'text': 'C', 'color': Colors.blue, 'span': 1},
                  {'text': '/', 'color': Colors.blue[100]!, 'span': 1},
                  {'text': 'x', 'color': Colors.blue[100]!, 'span': 1},
                  {'text': 'DEL', 'color': Colors.blue[100]!, 'span': 1},
                  {'text': '7', 'color': Colors.white, 'span': 1},
                  {'text': '8', 'color': Colors.white, 'span': 1},
                  {'text': '9', 'color': Colors.white, 'span': 1},
                  {'text': '+', 'color': Colors.blue[100]!, 'span': 1},
                  {'text': '4', 'color': Colors.white, 'span': 1},
                  {'text': '5', 'color': Colors.white, 'span': 1},
                  {'text': '6', 'color': Colors.white, 'span': 1},
                  {'text': '-', 'color': Colors.blue[100]!, 'span': 1},
                  {'text': '1', 'color': Colors.white, 'span': 1},
                  {'text': '2', 'color': Colors.white, 'span': 1},
                  {'text': '3', 'color': Colors.white, 'span': 1},
                  {'text': '=', 'color': Colors.blue, 'span': 2},
                  {'text': '0', 'color': Colors.white, 'span': 1},
                  {'text': '.', 'color': Colors.grey[300]!, 'span': 1},
                ];

                if (index == 16) {
                  return const SizedBox();
                }

                final data = buttonData[index];
                return GridTile(
                  child: CalculatorButton(
                    text: data['text'] as String,
                    color: data['color'] as Color,
                    onPressed: _onButtonPressed,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}