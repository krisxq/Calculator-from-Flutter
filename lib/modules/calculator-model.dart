class Calculate{
  String calculate({required String value}){
    int operatorIndex = value.indexOf(RegExp(r'[\+\-\x/]'));
    String operand1 = value.substring(0, operatorIndex);
    String operator = value[operatorIndex];
    String operand2 = value.substring(operatorIndex + 1);

    if(operand1.isEmpty || operand2.isEmpty){
      return '';
    }
    double firstNumber = double.parse(operand1);
    double secondNumber = double.parse(operand2);

    switch (operator){
      case '+':
        {
          return (firstNumber + secondNumber).toString();
        }
      case '-':
        {
          return (firstNumber - secondNumber).toString();
        }
      case '/':
        {
          return (firstNumber / secondNumber).toString();
        }
      case 'x':
        {
          return (firstNumber * secondNumber).toString();
        }
    }
    return '';
  }
}