import 'package:flutter/material.dart';
import 'package:mc_composer/numstepper.dart';
import 'package:mc_composer/statics.dart';

class ListItem extends StatefulWidget {
  const ListItem(
      {super.key,
      required this.food,
      required this.price,
      required this.startingValue,
      required this.onMeatSelected});

  final String food;
  final double price;
  final int startingValue;
  final Function(String, int) onMeatSelected;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.startingValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(getMeatImage(widget.food), width: 200, height: 200)),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.food,
          style: const TextStyle(fontSize: 18),
        ),
        Text('price: \$${widget.price}'),
        // const Spacer(),
        NumStepper(value: _currentValue, price: widget.price, onCountChanged: (int x) => widget.onMeatSelected(widget.food, x))
      ])
    ]));
  }
}
