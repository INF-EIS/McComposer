import 'package:flutter/material.dart';

class CollapsibleList extends StatefulWidget {
  const CollapsibleList({super.key});

  @override
  State<CollapsibleList> createState() => _CollapsibleListState();
}

class _CollapsibleListState extends State<CollapsibleList> {
  bool _isListOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: (details) {
        setState(() {
          _isListOpen =
              details.localPosition.dx > MediaQuery.of(context).size.width - 50;
        });
      },
      child: AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        right: _isListOpen ? 0 : -MediaQuery.of(context).size.width * 0.3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          color: Colors.white,
          child: ListView(
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
