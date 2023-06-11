import 'package:flutter/material.dart';
import '../constans.dart';

class BottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  const BottomButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 70,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        child: const Center(
          child: Text(
            'CALCULATE YOUR BMI',
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
