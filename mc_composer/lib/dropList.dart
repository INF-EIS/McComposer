import 'package:flutter/material.dart';

import 'listitem.dart';

class DropList extends StatefulWidget {
  final List<String> breadNames = ['Bun', 'Toasted Bun', 'Brown Bun'];
  final List<double> breadPrices = [3, 5, 4];
  List<int> breadAmounts;

  final List<String> meatNames = [
    'Beef Patty',
    'Pork Beef Patty',
    'Pork Patty',
    'Chicken Breasts',
    'Fried Chicken Breasts',
    '5 Chicken Nuggets'
  ];
  final List<double> meatPrices = [3, 5, 4, 4, 4, 4];
  List<int> meatAmounts;

  final List<String> vegetableNames = ['Lettuce', 'Tomato', 'Pickles'];
  final List<double> vegetablePrices = [3, 5, 4];
  List<int> vegetableAmounts;

  final List<String> sauceNames = ['Ketchup', 'Mayonaise', 'BBQ'];
  final List<double> saucePrices = [0.8, 0.8, 0.8];
  List<int> sauceAmounts;

  final List<String> extraNames = ['Cheddar', 'Bicky Onions'];
  final List<double> extraPrices = [1, 1];
  List<int> extraAmounts;

  DropList(
      {super.key,
      required this.breadAmounts,
      required this.meatAmounts,
      required this.vegetableAmounts,
      required this.sauceAmounts,
      required this.extraAmounts});

  @override
  State<DropList> createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  double totalPrice = 0;

  void getCount(String food, int count) {
    if (widget.breadNames.contains(food)) {
      getBreadCount(food, count);
    } else if (widget.meatNames.contains(food)) {
      getMeatCount(food, count);
    } else if (widget.vegetableNames.contains(food)) {
      getVegetableCount(food, count);
    } else if (widget.sauceNames.contains(food)) {
      getSauceCount(food, count);
    } else {
      getExtraCount(food, count);
    }
  }

  void getBreadCount(String bread, int count) {
    setState(() {
      int index = widget.breadNames.indexOf(bread);
      widget.breadAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getMeatCount(String meat, int count) {
    setState(() {
      int index = widget.meatNames.indexOf(meat);
      widget.meatAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getVegetableCount(String vegetable, int count) {
    setState(() {
      int index = widget.vegetableNames.indexOf(vegetable);
      widget.vegetableAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getSauceCount(String sauce, int count) {
    setState(() {
      int index = widget.sauceNames.indexOf(sauce);
      widget.sauceAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getExtraCount(String extra, int count) {
    setState(() {
      int index = widget.extraNames.indexOf(extra);
      widget.extraAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void calcTotalPrice() {
    totalPrice = 0;
    List<double> prices = widget.breadPrices +
        widget.meatPrices +
        widget.vegetablePrices +
        widget.saucePrices +
        widget.extraPrices;
    List<int> amounts = widget.breadAmounts +
        widget.meatAmounts +
        widget.vegetableAmounts +
        widget.sauceAmounts +
        widget.extraAmounts;
    for (int i = 0; i < amounts.length; i++) {
      setState(() {
        totalPrice += amounts[i] * prices[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Current Order",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.breadNames.length +
                      widget.meatNames.length +
                      widget.vegetableNames.length +
                      widget.sauceNames.length +
                      widget.extraNames.length,
                  itemBuilder: (ctx, i) {
                    List<String> names = widget.breadNames +
                        widget.meatNames +
                        widget.vegetableNames +
                        widget.sauceNames +
                        widget.extraNames;
                    List<double> prices = widget.breadPrices +
                        widget.meatPrices +
                        widget.vegetablePrices +
                        widget.saucePrices +
                        widget.extraPrices;
                    List<int> amounts = widget.breadAmounts +
                        widget.meatAmounts +
                        widget.vegetableAmounts +
                        widget.sauceAmounts +
                        widget.extraAmounts;
                    if (amounts[i] > 0) {
                      return ListItem(
                        food: names[i],
                        price: prices[i],
                        startingValue: amounts[i],
                        onMeatSelected: getCount,
                        smallImage: true,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
