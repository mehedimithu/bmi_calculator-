import 'dart:math';

class CalculateBmi {
  CalculateBmi(this.bmiHeight, this.bmiWeight);

  final int bmiHeight;
  final int bmiWeight;
  double _bmi = 0;

  String calculate() {
    _bmi = bmiWeight / pow(bmiHeight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are overweight, exercise everyday';
    } else if (_bmi > 18.5) {
      return ' You have normal weight. Keep it up ';
    } else {
      return 'You are underweight, eat a bit more';
    }
  }
}
