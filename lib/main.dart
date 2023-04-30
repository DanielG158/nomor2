import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kalkulator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _selectedOperation = "+";
  String _result = "";

  void _calculate() {
  double num1 = double.parse(_num1Controller.text);
  double num2 = double.parse(_num2Controller.text);
  double result = 0.0;

  switch (_selectedOperation) {
    case "+":
      result = num1 + num2;
      break;
    case "-":
      result = num1 - num2;
      break;
    case "*":
      result = num1 * num2;
      break;
    case "/":
      result = num1 / num2;
      break;
  }

  setState(() {
    _result = result.toStringAsFixed(2);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          TextField(
            controller: _num1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter first number',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _num2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter second number',
            ),
          ),
          SizedBox(height: 20),
          DropdownButton(
            value: _selectedOperation,
            onChanged: (value) {
              setState(() {
                _selectedOperation = value.toString();
              });
            },
            items: [
              DropdownMenuItem(child: Text('+'), value: '+'),
              DropdownMenuItem(child: Text('-'), value: '-'),
              DropdownMenuItem(child: Text('*'), value: '*'),
              DropdownMenuItem(child: Text('/'), value: '/'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20),
          Text(
            'Result: $_result',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ), 
    ); 
  } 
}
