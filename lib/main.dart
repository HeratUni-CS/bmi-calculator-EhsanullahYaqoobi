import 'package:flutter/material.dart';
import 'views/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0D22)),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
      ),
      home: const Inputpage(),
    );
  }
}
