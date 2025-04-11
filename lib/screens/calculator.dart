import 'package:flutter/material.dart';
import '../utils/calculator_logic.dart';
import '../widgets/button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  final CalculatorLogic _calculatorLogic = CalculatorLogic();

  void _onButtonPressed(String value) {
    setState(() {
      _display = _calculatorLogic.processInput(value, _display);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Button grid
          Expanded(
            flex: 4,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                CalculatorButton(
                  text: 'C',
                  onPressed: () => _onButtonPressed('C'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '±',
                  onPressed: () => _onButtonPressed('±'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '%',
                  onPressed: () => _onButtonPressed('%'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '÷',
                  onPressed: () => _onButtonPressed('÷'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '7',
                  onPressed: () => _onButtonPressed('7'),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => _onButtonPressed('8'),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => _onButtonPressed('9'),
                ),
                CalculatorButton(
                  text: '×',
                  onPressed: () => _onButtonPressed('×'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '4',
                  onPressed: () => _onButtonPressed('4'),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => _onButtonPressed('5'),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => _onButtonPressed('6'),
                ),
                CalculatorButton(
                  text: '-',
                  onPressed: () => _onButtonPressed('-'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '1',
                  onPressed: () => _onButtonPressed('1'),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => _onButtonPressed('2'),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => _onButtonPressed('3'),
                ),
                CalculatorButton(
                  text: '+',
                  onPressed: () => _onButtonPressed('+'),
                  isOperator: true,
                ),
                CalculatorButton(
                  text: '0',
                  onPressed: () => _onButtonPressed('0'),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => _onButtonPressed('.'),
                ),
                CalculatorButton(
                  text: '=',
                  onPressed: () => _onButtonPressed('='),
                  isOperator: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}