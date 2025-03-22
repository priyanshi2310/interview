// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _result = '0';
  String _expression = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _result = '0';
        _expression = '';
      } else if (buttonText == '=' && _expression.isNotEmpty) {
        try {
          _result = _calculateResult(_expression).toString();
          _output = _result;
        } catch (e) {
          _output = 'Error';
        }
      } else if (buttonText == 'DEL') {
        _expression =
            _expression.isNotEmpty
                ? _expression.substring(0, _expression.length - 1)
                : '';
        _output = _expression.isEmpty ? '0' : _expression;
      } else {
        _expression += buttonText;
        _output = _expression;
      }
    });
  }

 
  dynamic _calculateResult(String expression) {
    try {
      final expr = Expression.parse(expression);
      final evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expr, {});
      if (result is double) {
       
        if (result == result.toInt()) {
          return result.toInt(); // Convert to integer if it's a whole number
        } else {
          return result; // Return as double if not a whole number
        }
      } else if (result is int) {
        return result; // Return as integer if the result is an integer
      }
    } catch (e) {
      return 0; // Return 0 if there's an error
    }
    return 0; // Return 0 for other cases
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'), backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('DEL'),
              _buildButton('+'),
            ],
          ),
          Row(children: [_buildButton('=')]),
        ],
      ),
    );
  }
}
