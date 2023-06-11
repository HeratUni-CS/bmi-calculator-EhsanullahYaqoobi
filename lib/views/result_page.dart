import 'package:flutter/material.dart';
import 'package:prog_08_bmi/components/ReusableWidget.dart';
import 'package:prog_08_bmi/components/bottom_button.dart';
import 'package:prog_08_bmi/constans.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String bmi;
  final String interpretation;
  const ResultPage(
      {super.key,
      required this.result,
      required this.bmi,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              color: kActiveCardColor,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NORMAL',
                    style: kResultTextStyle,
                  ),
                  Text(
                    "25",
                    style: kBMITextStyle,
                  ),
                  Text(
                    'You are good to go',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'RECALCULATE',
          ),
        ],
      ),
    );
  }
}
