import 'package:flutter/material.dart';
import 'package:mc_composer/numstepper.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.food, required this.price, required this.startingValue});

  final String food;
  final double price;
  final int startingValue;

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

  String getPhoto() {
    switch(widget.food) {
      case ("Cow Patty"):
        return 'BeefPatty.jpeg';
      case ("Pork Cow Patty"):
        return 'PorkCowPatty.jpeg';
      case ("Pork Patty"):
        return 'PorkPatty.jpeg';
      case ("Chicken Breasts"):
        return 'ChickenBreasts.jpeg';
      case ("Fried Chicken Breasts"):
        return 'FriedChickenBreasts.png';
      case ("5 Chicken Nuggets"):
        return 'ChickenNuggets.png';
      default:
        return 'McDoLogo.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(getPhoto(), width: 200, height: 200)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.food,
            style: const TextStyle(fontSize: 18),
          ),
          Text('price: \$${widget.price}'),
          // const Spacer(),
          NumStepper(value: _currentValue, price: widget.price)
        ]
      )
    ]));
  }
}
