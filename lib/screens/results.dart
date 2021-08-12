import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/input.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results( this.bmiResult,  this.resultText, this.interpretation,);

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kLargeTextStyel,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReuseableCard(
                color: kActiveCardColor,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomBtn(),
        ],
      ),
    );
  }
}

class BottomBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        width: MediaQuery.of(context).size.width,
        height: KBottomContainerHeight,
        child: Text(
          "Re-Calculate",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
