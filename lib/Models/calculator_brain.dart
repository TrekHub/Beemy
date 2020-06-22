import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String bmiDescription() {
    if (_bmi >= 25) {
      return 'Your BMI is too high.It can be bad on your health.You need to work on your weight and what you eat. Make sure you have some exercise';
    } else if (_bmi > 18.5) {
      return 'Good Work!!. Your BMI vakue is normal. Keep up with the healthy practices';
    } else {
      return 'Your BMI value is too low. You need to check on what you eat. Make sure you are having a balancecd diet during each meal';
    }
  }
}
