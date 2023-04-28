import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.food, required this.price});

  final String food;
  final double price;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('assets/McDoLogo.png', width: 200, height: 200)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.food,
            style: const TextStyle(fontSize: 18),
          ),
          Text(widget.price.toString()),
          // const Spacer(),
          
        ],
      )
    ]));
  }
}
