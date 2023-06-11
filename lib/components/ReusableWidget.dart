import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.color, this.child, this.onPressed});

  final Color color;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
