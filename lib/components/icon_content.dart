import 'package:flutter/material.dart';
import '../constans.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconContent({required this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        iconData,
        size: 65,
        color: const Color(0xFF868892),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        label,
        style: kLabelStyle,
      ),
    ]);
  }
}
