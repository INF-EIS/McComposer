import 'package:flutter/material.dart';

class BurgerView extends StatefulWidget {
  const BurgerView({super.key});

  @override
  State<BurgerView> createState() => _BurgerViewState();
}

class _BurgerViewState extends State<BurgerView> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('BurgerTop.jpeg', fit: BoxFit.cover),
      Image.asset('BeefPatty1.png', fit: BoxFit.cover, width: 300,),
      Image.asset('BurgerBottom.jpeg', fit: BoxFit.cover)
    ],);
  }
}
