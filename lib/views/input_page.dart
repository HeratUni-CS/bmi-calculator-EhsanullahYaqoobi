import 'package:prog_08_bmi/bmi_brain.dart';
import '../components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/ReusableWidget.dart';
import '../constans.dart';
import 'result_page.dart';
import '../components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class Inputpage extends StatefulWidget {
  const Inputpage({
    super.key,
  });

  @override
  State<Inputpage> createState() => _InputPageState();
}

class _InputPageState extends State<Inputpage> {
  Gender? selectedGender;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: (selectedGender == Gender.male)
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: (selectedGender == Gender.female)
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          ReusableWidget(
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    trackHeight: 1,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF888993),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x30EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    min: 120,
                    max: 220,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  color: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            iconData: Icons.remove,
                          ),
                          const SizedBox(width: 10),
                          RoundIconButton(
                            iconData: Icons.add,
                            onPressed: () {
                              setState(
                                () {
                                  weight++;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReusableWidget(
                  color: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            iconData: Icons.remove,
                          ),
                          const SizedBox(width: 10),
                          RoundIconButton(
                            iconData: Icons.add,
                            onPressed: () {
                              setState(
                                () {
                                  age++;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              BMIBrain bmiBrain = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      result: bmiBrain.getResult(),
                      bmi: bmiBrain.getBMI(),
                      interpretation: bmiBrain.getInterpretation(),
                    );
                  },
                ),
              );
            },
            label: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
