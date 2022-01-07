import 'dart:developer';
import 'dart:math' as math;

class FakeFirestore {
   double calculateBMI(double h, double w) {
   final _bmi = w / math.pow(h / 100, 2);
    log('FakeFirestore.alculateBMI _bmi =====> $_bmi');

    return _bmi;
  }
  
  

    String getResult(double _bmi) {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


    String getInterpretation(double _bmi) {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}
final FakeFirestore fakeFirestore = FakeFirestore();