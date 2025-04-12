// utils/calculator_logic.dart
class CalculatorLogic {
  String _expression = ''; // To store the full expression (e.g., "5 + 3")
  String _currentInput = ''; // To store the current number being typed
  String _operator = ''; // To store the current operator
  double _firstOperand = 0;
  double _secondOperand = 0;
  bool _isNewOperation = true;

  String processInput(String input) {
    if (input == 'C') {
      _reset();
      return '0';
    } else if (input == 'DEL') {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
        if (_currentInput.isNotEmpty) {
          _currentInput = _currentInput.substring(0, _currentInput.length - 1);
        } else if (_operator.isNotEmpty) {
          _operator = '';
        }
        return _expression.isEmpty ? '0' : _expression;
      }
      return '0';
    } else if (input == '=') {
      if (_operator.isNotEmpty && _currentInput.isNotEmpty) {
        _secondOperand = double.parse(_currentInput);
        double result = _calculate();
        // Format the result to avoid .0 for integers
        _expression = _formatNumber(result);
        _currentInput = _expression;
        _operator = '';
        _isNewOperation = true;
        return _expression;
      }
      return _expression.isEmpty ? '0' : _expression;
    } else if ('+-/x'.contains(input)) {
      if (_currentInput.isNotEmpty) {
        _firstOperand = double.parse(_currentInput);
        _operator = input;
        _expression = '$_expression $input ';
        _currentInput = '';
      }
      return _expression;
    } else if (input == '.') {
      if (!_currentInput.contains('.')) {
        _currentInput += input;
        _expression += input;
      }
      return _expression;
    } else {
      if (_isNewOperation) {
        _currentInput = input;
        _expression = input;
        _isNewOperation = false;
      } else {
        _currentInput += input;
        _expression += input;
      }
      return _expression;
    }
  }

  double _calculate() {
    switch (_operator) {
      case '+':
        return _firstOperand + _secondOperand;
      case '-':
        return _firstOperand - _secondOperand;
      case 'x':
        return _firstOperand * _secondOperand;
      case '/':
        return _secondOperand != 0 ? _firstOperand / _secondOperand : double.infinity;
      default:
        return 0;
    }
  }

  String _formatNumber(double number) {
    // If the number is an integer, remove the .0
    if (number == number.toInt()) {
      return number.toInt().toString();
    }
    return number.toString();
  }

  void _reset() {
    _expression = '';
    _currentInput = '';
    _operator = '';
    _firstOperand = 0;
    _secondOperand = 0;
    _isNewOperation = true;
  }
}