import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MathCalculatorPage(title: 'Math Operations Calculator'),
    );
  }
}

class MathCalculatorPage extends StatefulWidget {
  const MathCalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<MathCalculatorPage> createState() => _MathCalculatorPageState();
}

class _MathCalculatorPageState extends State<MathCalculatorPage> {
  double _currentNumber = 1;

  // Math operation functions - each function modifies the current number
  void _add() {
    setState(() {
      _currentNumber += 1;
    });
  }

  void _subtract() {
    setState(() {
      _currentNumber -= 1;
    });
  }

  void _multiply() {
    setState(() {
      _currentNumber *= 2;
    });
  }

  void _divide() {
    setState(() {
      if (_currentNumber != 0) {
        _currentNumber /= 2;
      }
    });
  }

  void _square() {
    setState(() {
      _currentNumber = _currentNumber * _currentNumber;
    });
  }

  void _cube() {
    setState(() {
      _currentNumber = _currentNumber * _currentNumber * _currentNumber;
    });
  }

  void _squareRoot() {
    setState(() {
      if (_currentNumber >= 0) {
        _currentNumber = math.sqrt(_currentNumber);
      }
    });
  }

  void _reset() {
    setState(() {
      _currentNumber = 1;
    });
  }

  // Helper method to format the display number
  String _formatNumber(double number) {
    if (number == number.toInt()) {
      //this line checks if number is whole num or not
      return number
          .toInt()
          .toString(); // comverts double to integrer and then integer to double
    } else {
      return number.toStringAsFixed(2);
    }
  }

  // Helper method to create operation buttons
  Widget _buildOperationButton({
    required String label,
    required VoidCallback onPressed,
    required IconData icon,
    Color? color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display section
            Card(
              elevation: 8,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Current Number:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatNumber(_currentNumber),
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Operation buttons grid
            Column(
              children: [
                // First row: Add, Subtract
                Row(
                  children: [
                    _buildOperationButton(
                      label: 'Add 1',
                      onPressed: _add,
                      icon: Icons.add,
                      color: Colors.green.shade100,
                    ),
                    _buildOperationButton(
                      label: 'Subtract 1',
                      onPressed: _subtract,
                      icon: Icons.remove,
                      color: Colors.red.shade100,
                    ),
                  ],
                ),

                // Second row: Multiply, Divide
                Row(
                  children: [
                    _buildOperationButton(
                      label: 'Multiply by 2',
                      onPressed: _multiply,
                      icon: Icons.close,
                      color: Colors.blue.shade100,
                    ),
                    _buildOperationButton(
                      label: 'Divide by 2',
                      onPressed: _divide,
                      icon: Icons.horizontal_rule,
                      color: Colors.orange.shade100,
                    ),
                  ],
                ),

                // Third row: Square, Cube
                Row(
                  children: [
                    _buildOperationButton(
                      label: 'Square (x²)',
                      onPressed: _square,
                      icon: Icons.crop_square,
                      color: Colors.purple.shade100,
                    ),
                    _buildOperationButton(
                      label: 'Cube (x³)',
                      onPressed: _cube,
                      icon: Icons.view_in_ar,
                      color: Colors.indigo.shade100,
                    ),
                  ],
                ),

                // Fourth row: Square Root, Reset
                Row(
                  children: [
                    _buildOperationButton(
                      label: 'Square Root (√x)',
                      onPressed: _squareRoot,
                      icon: Icons.square_foot,
                      color: Colors.teal.shade100,
                    ),
                    _buildOperationButton(
                      label: 'Reset',
                      onPressed: _reset,
                      icon: Icons.refresh,
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
