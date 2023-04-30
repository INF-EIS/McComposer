import 'package:flutter/material.dart';
import 'package:mc_composer/statics.dart';

class BurgerView extends StatefulWidget {
  const BurgerView({super.key, required this.meatAmounts});

  final List<int> meatAmounts;

  // List<int> getMeatAmounts() {
  //   return meatAmounts;
  // }

  // int getMeatAmount(int index) {
  //   return meatAmounts[index];
  // }

  @override
  State<BurgerView> createState() => _BurgerViewState();
}

class _BurgerViewState extends State<BurgerView> {
  List<Widget> meats = [];
  final double sidePadding = 200.0;
  void initializeMeats() {
    meats = [
      Padding(
          padding: EdgeInsetsDirectional.fromSTEB(sidePadding, 0, sidePadding, 0),
          child: Image.asset('BurgerTop.jpeg', fit: BoxFit.cover)),
      Padding(
          padding: EdgeInsetsDirectional.fromSTEB(sidePadding, 0, sidePadding, 0),
          child: Image.asset('BurgerBottom.jpeg', fit: BoxFit.cover))
    ];
  }

  @override
  void initState() {
    super.initState();
    addMeatImages();
  }

  @override
  void didUpdateWidget(covariant BurgerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    addMeatImages();
  }

  void addMeatImages() {
    initializeMeats();
    int length = widget.meatAmounts.length;
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < widget.meatAmounts[i]; j++) {
        meats.insert(1, Padding(
          padding: EdgeInsetsDirectional.fromSTEB(sidePadding, 0, sidePadding, 0),
          child: Image.asset(getMeatImageI(i), fit: BoxFit.cover)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: meats,
    ));
  }
}
