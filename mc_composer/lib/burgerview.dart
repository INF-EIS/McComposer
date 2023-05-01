import 'package:flutter/material.dart';
import 'package:mc_composer/statics.dart';
import 'dart:math';

class BurgerView extends StatefulWidget {
  BurgerView(
      {super.key, required this.breadAmounts, required this.foodAmounts});

  List<int> breadAmounts;
  List<int> foodAmounts;

  List<int> getBreads() {
    return breadAmounts;
  }

  List<int> getMeats() {
    return foodAmounts;
  }

  @override
  State<BurgerView> createState() => _BurgerViewState();
}

class _BurgerViewState extends State<BurgerView> {
  List<Widget> foodStack = [];
  final double startPadding = 220.0;
  double sidePadding = 220.0;

  void setPadding() {
    int sum = widget.breadAmounts.reduce((a, b) => a + b);
    sum += widget.foodAmounts.reduce((a, b) => a + b);
    //First, I make sure it follows a log scale (with returning e if the value is 1)
    //Secondly, I limit the log scale at count 7, so that it becomes a scrollable list
    sidePadding = startPadding *
        log(sum <= 1
            ? e
            : (sum + 1 <= 7)
                ? sum + 1
                : 7) /
        1.3;
  }

  @override
  void initState() {
    super.initState();
    updateFoodStack();
  }

  @override
  void didUpdateWidget(covariant BurgerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateFoodStack();
  }

  void updateFoodStack() {
    setPadding();
    foodStack = [];
    addBuns(true);
    addFoodImages();
    addBuns(false);
  }

  void addBuns(bool isTop) {
    int length = widget.breadAmounts.length;
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < widget.breadAmounts[i]; j++) {
        if (isTop) {
          foodStack.add(Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  sidePadding, 0, sidePadding, 0),
              child: Image.asset(getBunImageI(i, true), fit: BoxFit.cover)));
        } else {
          foodStack.add(Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  sidePadding, 0, sidePadding, 0),
              child: Image.asset(getBunImageI(i, false), fit: BoxFit.cover)));
        }
      }
    }
  }

  void addFoodImages() {
    int length = widget.foodAmounts.length;
    for (int i = 0; i < length; i++) {
      for (int j = 0; j < widget.foodAmounts[i]; j++) {
        foodStack.add(Padding(
            padding:
                EdgeInsetsDirectional.fromSTEB(sidePadding, 0, sidePadding, 0),
            child: Image.asset(getImageI(i), fit: BoxFit.cover)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: foodStack,
    ));
  }
}
