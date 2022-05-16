import 'dart:math';


class calculate
{

  calculate({required this.height,required this.weight});

  final int height;
  final int weight;
  late double _bmi=0;


  String ResultNumber(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String ResultText(){
    if(_bmi>=25)
    {
      return "OverWeight";
    }
    else if(_bmi>=18.5 && _bmi<25)
    {
      return "Normal";
    }
    else
    {
      return "UnderWeight";
    }

  }

  String Feedback(){
    if(_bmi>=25)
    {
      return "Your BMI is higher than  others, Do Exercise";
    }
    else if(_bmi>18.5 && _bmi<25)
    {
      return "It's all normal for you, Good job!!";
    }
    else
    {
      return "Your BMI is lower, you can focus more on eating";
    }
  }


}