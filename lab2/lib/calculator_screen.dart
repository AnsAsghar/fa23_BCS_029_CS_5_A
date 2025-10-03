import 'package:flutter/material.dart';
import 'calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _calculator = CalculatorLogic();
  String _display = '0';
  String _expression = '';

  void _onButtonPressed(String value) {
    setState(() {
      final result = _calculator.handleInput(value);
      _display = result['display'] ?? '0';
      _expression = result['expression'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Expression display
                  Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Result display
                  Text(
                    _display,
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // Buttons area
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _buildButtonRow(['C', '⌫', '%', '÷']),
                  _buildButtonRow(['7', '8', '9', '×']),
                  _buildButtonRow(['4', '5', '6', '−']),
                  _buildButtonRow(['1', '2', '3', '+']),
                  _buildButtonRow(['±', '0', '.', '=']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((button) => _buildButton(button)).toList(),
      ),
    );
  }

  Widget _buildButton(String text) {
    // Determine button color
    Color buttonColor;
    Color textColor = Colors.white;

    if (text == 'C' || text == '⌫') {
      buttonColor = Colors.grey[800]!;
    } else if (text == '÷' || text == '×' || text == '−' || text == '+' || text == '=') {
      buttonColor = Colors.orange;
    } else if (text == '%' || text == '±') {
      buttonColor = Colors.grey[700]!;
    } else {
      buttonColor = Colors.grey[850]!;
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
