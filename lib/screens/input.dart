import 'package:bmi_calculator/components/cal_bmi.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _selected;
  int height = 120;
  int weight = 67;
  int age = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        _selected = Gender.male;
                      });
                    },
                    color: _selected == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        _selected = Gender.female;
                      });
                    },
                    color: _selected == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              onPress: () {},
              color: kInactiveCardColor,
              cardChild: Column(
                children: [
                  Text("HEIGHT", style: kLableTextStyel),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kDataShowTextStyel),
                      Text("cm", style: kLableTextStyel),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Colors.grey,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLableTextStyel),
                        Text(weight.toString(), style: kDataShowTextStyel),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                heroTag: "btn1",
                                backgroundColor: Color(0xff4c4f5e),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            SizedBox(
                              width: 6,
                            ),
                            FloatingActionButton(
                                heroTag: "btn2",
                                backgroundColor: Color(0xff4c4f5e),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {},
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLableTextStyel),
                        Text(age.toString(), style: kDataShowTextStyel),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                heroTag: "btn3",
                                backgroundColor: Color(0xff4c4f5e),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(
                              width: 6,
                            ),
                            FloatingActionButton(
                                heroTag: "btn4",
                                backgroundColor: Color(0xff4c4f5e),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBmi cal = CalculateBmi(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(cal.calculate(),
                           cal.getResult(), cal.getInterpretation())));
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 20),
              color: kBottomContainerColor,
              width: MediaQuery.of(context).size.width,
              height: KBottomContainerHeight,
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }
}

class ReuseableCard extends StatelessWidget {
  ReuseableCard(
      {required this.color, required this.cardChild, required this.onPress});

  final Color color;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
