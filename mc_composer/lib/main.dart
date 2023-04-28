import 'package:flutter/material.dart';
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
            Image.asset('assets/McDoLogo.png',
                fit: BoxFit.cover, width: 100, height: 100),
            Expanded(
                child: TabBarView(
              children: [
                const SizedBox.shrink(),
                ListView(
                  children: const [
                    ListItem(
                      food: 'Cow Patty',
                      price: 3.0,
                      startingValue: 0,
                    ),
                    ListItem(
                      food: 'Pork Cow Patty',
                      price: 5.0,
                      startingValue: 1,
                    ),
                    ListItem(
                      food: 'Pork Patty',
                      price: 4.0,
                      startingValue: 0,
                    ),
                    ListItem(
                      food: 'Chicken Breasts',
                      price: 4.0,
                      startingValue: 0,
                    ),
                    ListItem(
                      food: 'Fried Chicken Breasts',
                      price: 4.0,
                      startingValue: 0,
                    ),
                    ListItem(
                      food: '5 Chicken Nuggets',
                      price: 4.0,
                      startingValue: 0,
                    ),
                  ],
                ),
                const SizedBox.shrink(),
                const SizedBox.shrink(),
                const SizedBox.shrink(),
              ],
            )),
          ],
        ));
  }
}
