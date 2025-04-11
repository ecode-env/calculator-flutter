class CalculatorLogic {
  String _firstNumber = '';
  String _secondNumber = '';
  String _operator = '';
  bool _isFirstNumber = true;

  String processInput(String input, String currentDisplay) {
    if (input == 'C') {
      _firstNumber = '';
      _secondNumber = '';
      _operator = '';
      _isFirstNumber = true;
      return '0';
    }

    if (input == '=') {
      if (_firstNumber.isEmpty || _secondNumber.isEmpty || _operator.isEmpty) {
        return currentDisplay;
      }
      double num1 = double.parse(_firstNumber);
      double num2 = double.parse(_secondNumber);
      double result = _calculate(num1, num2, _operator);
      _firstNumber = result.toString();
      _secondNumber = '';
      _operator = '';
      _isFirstNumber = true;
      return result.toString();
    }

    if (_isOperator(input)) {
      if (_firstNumber.isEmpty) return currentDisplay;
      _operator = input;
      _isFirstNumber = false;
      return _firstNumber;
    }

    if (_isFirstNumber) {
      _firstNumber += input;
      return _firstNumber;
    } else {
      _secondNumber += input;
      return _secondNumber;
    }
  }

  bool _isOperator(String input) {
    return ['+', '-', '×', '÷'].contains(input);
  }

  double _calculate(double num1, double num2, String operator) {
    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '×':
        return num1 * num2;
      case '÷':
        return num2 != 0 ? num1 / num2 : double.infinity;
      default:
        return 0;
    }
  }
}