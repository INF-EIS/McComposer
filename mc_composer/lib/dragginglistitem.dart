import 'package:flutter/material.dart';
import 'package:mc_composer/statics.dart';

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.food,
  });

  final GlobalKey dragKey;
  final String food;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
          key: dragKey,
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(getImage(food, null), width: 100, height: 100)),
    );
  }
}
