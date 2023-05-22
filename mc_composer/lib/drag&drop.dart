import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mc_composer/burgerview.dart';
import 'package:mc_composer/listitem.dart';
import 'dragginglistitem.dart';
import 'package:collection/collection.dart';

//TODO: removing items?

class DragdropPage extends StatefulWidget {
  const DragdropPage({super.key, required this.title});

  final String title;

  @override
  State<DragdropPage> createState() => _DragdropPageState();
}

class _DragdropPageState extends State<DragdropPage> {
  late BurgerView bv;

  final List<String> breadNames = ['Bun', 'Toasted Bun', 'Brown Bun'];
  final List<double> breadPrices = [3, 5, 4];
  List<int> breadAmounts = [0, 0, 0];

  final List<String> meatNames = [
    'Beef Patty',
    'Pork Beef Patty',
    'Pork Patty',
    'Chicken Breasts',
    'Fried Chicken Breasts',
    '5 Chicken Nuggets'
  ];
  final List<double> meatPrices = [3, 5, 4, 4, 4, 4];
  List<int> meatAmounts = [0, 0, 0, 0, 0, 0];

  final List<String> vegetableNames = ['Lettuce', 'Tomato', 'Pickles'];
  final List<double> vegetablePrices = [3, 5, 4];
  List<int> vegetableAmounts = [0, 0, 0];

  final List<String> sauceNames = ['Ketchup', 'Mayonaise', 'BBQ'];
  final List<double> saucePrices = [0.8, 0.8, 0.8];
  List<int> sauceAmounts = [0, 0, 0];

  final List<String> extraNames = ['Cheddar', 'Bicky Onions'];
  final List<double> extraPrices = [1, 1];
  List<int> extraAmounts = [0, 0];

  @override
  void initState() {
    super.initState();
    bv = BurgerView(
        breadAmounts: breadAmounts,
        foodAmounts:
            meatAmounts + vegetableAmounts + sauceAmounts + extraAmounts);
  }

  @override
  void didUpdateWidget(covariant DragdropPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  double totalPrice = 0;

  void getCount(String food, int count) {
    if (breadNames.contains(food)) {
      getBreadCount(food, count);
    } else if (meatNames.contains(food)) {
      getMeatCount(food, count);
    } else if (vegetableNames.contains(food)) {
      getVegetableCount(food, count);
    } else if (sauceNames.contains(food)) {
      getSauceCount(food, count);
    } else {
      getExtraCount(food, count);
    }
  }

  void getBreadCount(String bread, int count) {
    setState(() {
      int index = breadNames.indexOf(bread);
      breadAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getMeatCount(String meat, int count) {
    setState(() {
      int index = meatNames.indexOf(meat);
      meatAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getVegetableCount(String vegetable, int count) {
    setState(() {
      int index = vegetableNames.indexOf(vegetable);
      vegetableAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getSauceCount(String sauce, int count) {
    setState(() {
      int index = sauceNames.indexOf(sauce);
      sauceAmounts[index] = count;
    });
    calcTotalPrice();
  }

  void getExtraCount(String extra, int count) {
    setState(() {
      int index = extraNames.indexOf(extra);
      extraAmounts[index] = count;
    });
    calcTotalPrice();
  }

  createModal() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              color: Colors.amber,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              const Text(
                                'Basket:',
                                style: TextStyle(fontSize: 40),
                              ),
                              const Spacer(),
                              CloseButton(
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          )),
                      Text('Price: \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 20)),
                      Expanded(
                        child: ListView.builder(
                            itemCount: breadNames.length +
                                meatNames.length +
                                vegetableNames.length +
                                sauceNames.length +
                                extraNames.length,
                            itemBuilder: (ctx, i) {
                              List<String> names = breadNames +
                                  meatNames +
                                  vegetableNames +
                                  sauceNames +
                                  extraNames;
                              List<double> prices = breadPrices +
                                  meatPrices +
                                  vegetablePrices +
                                  saucePrices +
                                  extraPrices;
                              List<int> amounts = breadAmounts +
                                  meatAmounts +
                                  vegetableAmounts +
                                  sauceAmounts +
                                  extraAmounts;
                              if (amounts[i] > 0) {
                                return ListItem(
                                  food: names[i],
                                  price: prices[i],
                                  startingValue: amounts[i],
                                  onMeatSelected: getCount,
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                      ),
                    ]),
              ));
        });
  }

  void calcTotalPrice() {
    totalPrice = 0;
    List<double> prices =
        breadPrices + meatPrices + vegetablePrices + saucePrices + extraPrices;
    List<int> amounts = breadAmounts +
        meatAmounts +
        vegetableAmounts +
        sauceAmounts +
        extraAmounts;
    for (int i = 0; i < amounts.length; i++) {
      setState(() {
        totalPrice += amounts[i] * prices[i];
      });
    }
  }

  final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: <Widget>[
            Image.asset('assets/McDoLogo.png',
                fit: BoxFit.cover, width: 25, height: 22),
            const Padding(padding: EdgeInsets.all(3.0)),
            Text(widget.title)
          ]),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Bread"),
              Tab(text: "Meat"),
              Tab(text: "Vegetables"),
              Tab(text: "Sauces"),
              Tab(text: "Extra"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: DragTarget<ListItem>(
              builder: (context, candidateItems, rejectedItems) {
                return (const ListEquality().equals(breadAmounts, [0, 0, 0]) &&
                        candidateItems.isEmpty)
                    ? Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Drag an item here, to make your burger!",
                          textAlign: TextAlign.center,
                        ))
                    : BurgerView(
                        breadAmounts: breadAmounts,
                        foodAmounts: meatAmounts +
                            vegetableAmounts +
                            sauceAmounts +
                            extraAmounts,
                        highlighted: candidateItems.isNotEmpty);
              },
              onAccept: (ListItem item) {
                item.onMeatSelected(item.food, item.startingValue + 1);
              },
            )),
            Expanded(
              child: TabBarView(
                children: [
                  // Breads
                  ListView.builder(
                      itemCount: breadNames.length,
                      itemBuilder: (ctx, i) {
                        return Draggable<ListItem>(
                          data: ListItem(
                            food: breadNames[i],
                            isTop: null,
                            price: breadPrices[i],
                            startingValue: breadAmounts[i],
                            onMeatSelected: getBreadCount,
                            draganddrop: true,
                          ),
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            food: breadNames[i],
                          ),
                          child: ListItem(
                            food: breadNames[i],
                            isTop: null,
                            price: breadPrices[i],
                            startingValue: breadAmounts[i],
                            onMeatSelected: getBreadCount,
                            draganddrop: true,
                          ),
                        );
                      }),
                  // Meats
                  ListView.builder(
                      itemCount: meatNames.length,
                      itemBuilder: (ctx, i) {
                        return Draggable<ListItem>(
                          data: ListItem(
                            food: meatNames[i],
                            isTop: null,
                            price: meatPrices[i],
                            startingValue: meatAmounts[i],
                            onMeatSelected: getMeatCount,
                            draganddrop: true,
                          ),
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            food: meatNames[i],
                          ),
                          child: ListItem(
                            food: meatNames[i],
                            isTop: null,
                            price: meatPrices[i],
                            startingValue: meatAmounts[i],
                            onMeatSelected: getMeatCount,
                            draganddrop: true,
                          ),
                        );
                      }),
                  // Vegetables
                  ListView.builder(
                      itemCount: vegetableNames.length,
                      itemBuilder: (ctx, i) {
                        return Draggable<ListItem>(
                          data: ListItem(
                            food: vegetableNames[i],
                            isTop: null,
                            price: vegetablePrices[i],
                            startingValue: vegetableAmounts[i],
                            onMeatSelected: getVegetableCount,
                            draganddrop: true,
                          ),
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            food: vegetableNames[i],
                          ),
                          child: ListItem(
                            food: vegetableNames[i],
                            isTop: null,
                            price: vegetablePrices[i],
                            startingValue: vegetableAmounts[i],
                            onMeatSelected: getVegetableCount,
                            draganddrop: true,
                          ),
                        );
                      }),
                  // Vegetables
                  ListView.builder(
                      itemCount: sauceNames.length,
                      itemBuilder: (ctx, i) {
                        return Draggable<ListItem>(
                          data: ListItem(
                            food: sauceNames[i],
                            isTop: null,
                            price: saucePrices[i],
                            startingValue: sauceAmounts[i],
                            onMeatSelected: getSauceCount,
                            draganddrop: true,
                          ),
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            food: sauceNames[i],
                          ),
                          child: ListItem(
                            food: sauceNames[i],
                            isTop: null,
                            price: saucePrices[i],
                            startingValue: sauceAmounts[i],
                            onMeatSelected: getSauceCount,
                            draganddrop: true,
                          ),
                        );
                      }),
                  // Vegetables
                  ListView.builder(
                      itemCount: extraNames.length,
                      itemBuilder: (ctx, i) {
                        return Draggable<ListItem>(
                          data: ListItem(
                            food: extraNames[i],
                            isTop: null,
                            price: extraPrices[i],
                            startingValue: extraAmounts[i],
                            onMeatSelected: getExtraCount,
                            draganddrop: true,
                          ),
                          dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: DraggingListItem(
                            dragKey: _draggableKey,
                            food: extraNames[i],
                          ),
                          child: ListItem(
                            food: extraNames[i],
                            isTop: null,
                            price: extraPrices[i],
                            startingValue: extraAmounts[i],
                            onMeatSelected: getExtraCount,
                            draganddrop: true,
                          ),
                        );
                      }),
                ],
              ),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      createModal();
                    },
                    child: const Text('Show Basket')),
                ElevatedButton(
                    onPressed: () => {}, child: const Text('Finish')),
              ],
            )
          ],
        ));
  }
}
