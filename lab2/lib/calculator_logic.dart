class CalculatorLogic {
  String _displayValue = '0';
  String _expression = '';
  String _currentNumber = '';
  String _operator = '';
  double _previousValue = 0;
  bool _shouldResetDisplay = false;

  Map<String, String> handleInput(String input) {
    switch (input) {
      case 'C':
        _clear();
        break;
      case '⌫':
        _backspace();
        break;
      case '±':
        _toggleSign();
        break;
      case '%':
        _percentage();
        break;
      case '÷':
      case '×':
      case '−':
      case '+':
        _handleOperator(input);
        break;
      case '=':
        _calculate();
        break;
      case '.':
        _addDecimal();
        break;
      default:
        _addNumber(input);
        break;
    }

    return {
      'display': _displayValue,
      'expression': _expression,
    };
  }

  void _clear() {
    _displayValue = '0';
    _expression = '';
    _currentNumber = '';
    _operator = '';
    _previousValue = 0;
    _shouldResetDisplay = false;
  }

  void _backspace() {
    if (_shouldResetDisplay) return;

    if (_currentNumber.isNotEmpty) {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
      _displayValue = _currentNumber.isEmpty ? '0' : _currentNumber;
    }
  }

  void _toggleSign() {
    if (_currentNumber.isEmpty || _currentNumber == '0') return;

    if (_currentNumber.startsWith('-')) {
      _currentNumber = _currentNumber.substring(1);
    } else {
      _currentNumber = '-$_currentNumber';
    }
    _displayValue = _currentNumber;
  }

  void _percentage() {
    if (_currentNumber.isEmpty) return;

    double value = double.parse(_currentNumber);
    value = value / 100;
    _currentNumber = _formatNumber(value);
    _displayValue = _currentNumber;
  }

  void _addNumber(String number) {
    if (_shouldResetDisplay) {
      _currentNumber = number;
      _shouldResetDisplay = false;
    } else {
      if (_currentNumber == '0') {
        _currentNumber = number;
      } else {
        _currentNumber += number;
      }
    }
    _displayValue = _currentNumber;
  }

  void _addDecimal() {
    if (_shouldResetDisplay) {
      _currentNumber = '0.';
      _shouldResetDisplay = false;
    } else if (!_currentNumber.contains('.')) {
      _currentNumber = _currentNumber.isEmpty ? '0.' : '$_currentNumber.';
    }
    _displayValue = _currentNumber;
  }

  void _handleOperator(String op) {
    if (_currentNumber.isEmpty && _operator.isEmpty) {
      return;
    }

    if (_currentNumber.isNotEmpty) {
      if (_operator.isNotEmpty) {
        _calculate();
      } else {
        _previousValue = double.parse(_currentNumber);
      }
    }

    _operator = op;
    _expression = '${_formatNumber(_previousValue)} $op';
    _currentNumber = '';
    _shouldResetDisplay = false;
  }

  void _calculate() {
    if (_operator.isEmpty || _currentNumber.isEmpty) {
      return;
    }

    double currentValue = double.parse(_currentNumber);
    double result = 0;

    switch (_operator) {
      case '+':
        result = _previousValue + currentValue;
        break;
      case '−':
        result = _previousValue - currentValue;
        break;
      case '×':
        result = _previousValue * currentValue;
        break;
      case '÷':
        if (currentValue != 0) {
          result = _previousValue / currentValue;
        } else {
          _displayValue = 'Error';
          _expression = 'Cannot divide by zero';
          _currentNumber = '';
          _operator = '';
          _shouldResetDisplay = true;
          return;
        }
        break;
    }

    _expression = '${_formatNumber(_previousValue)} $_operator ${_formatNumber(currentValue)} =';
    _displayValue = _formatNumber(result);
    _currentNumber = _displayValue;
    _previousValue = result;
    _operator = '';
    _shouldResetDisplay = true;
  }

  String _formatNumber(double number) {
    // Remove unnecessary decimal points
    if (number == number.toInt()) {
      return number.toInt().toString();
    }
    
    // Format with up to 8 decimal places, removing trailing zeros
    String formatted = number.toStringAsFixed(8);
    formatted = formatted.replaceAll(RegExp(r'0*$'), '');
    formatted = formatted.replaceAll(RegExp(r'\.$'), '');
    
    return formatted;
  }
}
