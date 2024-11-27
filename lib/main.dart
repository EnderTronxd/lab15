import 'package:flutter/material.dart';
import 'function_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS-31: Taras\'s last Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  double? _result;
  final TextEditingController _xController = TextEditingController();
  final FunctionCalculator _calculator = FunctionCalculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CS-31: Taras\'s last Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _xController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter value for x',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateFunction,
              child: const Text('Calculate y = f(x)'),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                'Result: $_result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
            const SizedBox(height: 20),
            Text(
              'Counter: $_counter',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.person),
      ),
    );
  }

  void _calculateFunction() {
    final String xText = _xController.text;
    if (xText.isEmpty) {
      return;
    }
    final double x = double.tryParse(xText) ?? 0;
    try {
      setState(() {
        _result = _calculator.calculate(x);
      });
    } catch (e) {
      setState(() {
        _result = null;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('x cannot be zero.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
