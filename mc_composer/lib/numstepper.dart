import 'package:flutter/material.dart';

class NumStepper extends StatefulWidget {
  const NumStepper({super.key, required this.value, required this.price});

  final int value;
  final double price;

  @override
  State<NumStepper> createState() => _NumStepperState();
}

class _NumStepperState extends State<NumStepper> {
  int _currentValue = 0;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
    _totalPrice = _currentValue * widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => setState(() {
              final newValue = _currentValue - 1;
              _currentValue = newValue.clamp(0, 100);
            }),
          ),
          Text(_currentValue.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              final newValue = _currentValue + 1;
              _currentValue = newValue.clamp(0, 100);
            }),
          ),
        ],
      ),
      Text('\$${_currentValue * widget.price}')
    ]);
  }
}
