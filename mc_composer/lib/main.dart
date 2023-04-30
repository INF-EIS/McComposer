import 'package:flutter/material.dart';
import 'package:mc_composer/burgerview.dart';
import 'package:mc_composer/listitem.dart';

void main() {
  runApp(const MyApp());
}

class Palette {
  static const MaterialColor mcDoRed = MaterialColor(
    0xFFe60001, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffcf0001), //10%
      100: Color(0xffb80001), //20%
      200: Color(0xffb80001), //30%
      300: Color(0xff8a0001), //40%
      400: Color(0xff730001), //50%
      500: Color(0xff5c0000), //60%
      600: Color(0xff450000), //70%
      700: Color(0xff2e0000), //80%
      800: Color(0xff170000), //90%
      900: Color(0xff170000), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'McComposer',
      theme: ThemeData(
        primarySwatch: Palette.mcDoRed,
      ),
      home: const DefaultTabController(
          length: 5, child: MyHomePage(title: 'McComposer')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> meatNames = [
    'Beef Patty',
    'Pork Beef Patty',
    'Pork Patty',
    'Chicken Breasts',
    'Fried Chicken Breasts',
    '5 Chicken Nuggets'
  ];
  final List<double> meatPrices = [3, 5, 4, 4, 4, 4];
  final List<int> meatAmounts = [0, 1, 0, 0, 0, 0];

  void getBurgerCount(String food, int count) {
    setState(() {
      int index = meatNames.indexOf(food);
      meatAmounts[index] = count;
    });
    print(meatAmounts);
  }

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
              Tab(text: "bread"),
              Tab(text: "meat"),
              Tab(text: "vegetables"),
              Tab(text: "sauces"),
              Tab(text: "extra"),
            ],
          ),
        ),
        body: Column(
          children: [
            BurgerView(meatAmounts: meatAmounts),
            Expanded(
                flex: 2,
                child: TabBarView(
                  children: [
                    const SizedBox.shrink(),
                    ListView.builder(
                        itemCount: meatNames.length,
                        itemBuilder: (ctx, i) {
                          return ListItem(
                            food: meatNames[i],
                            price: meatPrices[i],
                            startingValue: meatAmounts[i],
                            onMeatSelected: getBurgerCount,
                          );
                        }),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                  ],
                )),
            ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                color: Colors.amber,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Winkelmandje:',
                                                  style:
                                                      TextStyle(fontSize: 40),
                                                ),
                                                const Spacer(),
                                                CloseButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                          child: ListView.builder(
                                              itemCount: meatNames.length,
                                              itemBuilder: (ctx, i) {
                                                if (meatAmounts[i] > 0) {
                                                  return ListItem(
                                                    food: meatNames[i],
                                                    price: meatPrices[i],
                                                    startingValue:
                                                        meatAmounts[i],
                                                    onMeatSelected:
                                                        getBurgerCount,
                                                  );
                                                } else {
                                                  return const SizedBox.shrink();
                                                }
                                              }),
                                        ),
                                      ]),
                                ));
                          });
                    },
                    child: const Text('Toon Winkelmandje')),
                ElevatedButton(
                    onPressed: () => {}, child: const Text('Afronden'))
              ],
            )
          ],
        ));
  }
}
