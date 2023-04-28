import 'package:flutter/material.dart';
import 'package:mc_composer/statics.dart';

class BurgerView extends StatefulWidget {
  const BurgerView({super.key, required this.meatAmounts});

  final List<int> meatAmounts;

  @override
  State<BurgerView> createState() => _BurgerViewState();
}

class _BurgerViewState extends State<BurgerView> {
  List<Widget> meats = [];
  void initializeMeats() {
    meats = [
      Image.asset('BurgerTop.jpeg', fit: BoxFit.cover),
      Image.asset('BurgerBottom.jpeg', fit: BoxFit.cover)
    ];
  }

  @override
  void initState() {
    super.initState();
    createMeats();
  }

  @override
  void didUpdateWidget(covariant BurgerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    createMeats();
  }

  void createMeats() {
    initializeMeats();
    int length = widget.meatAmounts.length;
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < widget.meatAmounts[i]; j++) {
        meats.insert(1, Image.asset(getMeatImageI(i), width: 350));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: meats,
    ));
  }
}
