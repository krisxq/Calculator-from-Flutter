import 'package:calculator/modules/result_value_model.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/modules/calculator-model.dart';
import 'package:calculator/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBtn extends StatefulWidget {
  final bool isEqualBtn;
  final String value;
  final Color textColor;
  const CustomBtn({
    super.key,
    this.isEqualBtn = false,
    required this.value,
    this.textColor = Colors.black
  });

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {

  ValueNotifier<bool> clickEffectNotifier = ValueNotifier(true);

  final Calculate calculate = Calculate();

  @override
  Widget build(BuildContext context) {
    final resultValue = Provider.of<ResultValueProvider>(context,listen: false);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTapDown: (_) {
        clickEffectNotifier.value = false;

        if (widget.value == 'AC') {
          resultValue.setDetailView = '';
          resultValue.setResultView = '';
          return;
        }

        if (widget.value == 'Clr') {
          if (resultValue.getDetailView.isEmpty) {
            return;
          }
          // remove last character from detail view
          resultValue.setDetailView =
              resultValue.getDetailView.substring(0, resultValue.getDetailView.length - 1);

          // also clear result view so old answer disappears
          resultValue.setResultView = '';
          return;
        }



        if (widget.value == '+' ||
            widget.value == '/' ||
            widget.value == '%' ||
            widget.value == 'x' ||
            widget.value == '-') {
          if (resultValue.getDetailView.isEmpty) {
            return;
          }

          if (resultValue.getDetailView.contains("+") ||
              resultValue.getDetailView.contains("-") ||
              resultValue.getDetailView.contains("/") ||
              resultValue.getDetailView.contains("%") ||
              resultValue.getDetailView.contains("x")) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Only Perform single Operations'))
            );
            return;
          }

          if (widget.value == '%') {
            resultValue.setResultView =
                (double.parse(resultValue.getDetailView) / 100).toString();
          }
        }

        if (widget.value == '=') {
          if (resultValue.getDetailView.isEmpty) {
            return;
          }
          if (!(resultValue.getDetailView.contains("+") ||
              resultValue.getDetailView.contains("-") ||
              resultValue.getDetailView.contains("/") ||
              resultValue.getDetailView.contains("x"))) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Add some operator for operation')));
            return;
          }
          resultValue.setResultView =
              calculate.calculate(value: resultValue.getDetailView);
          return;
        }

        resultValue.setDetailView =
          '${resultValue.getDetailView}${widget.value}';
        return;
      },
      onTapUp: (_){
        Future.delayed(Duration(milliseconds: 200)).then((value){
          clickEffectNotifier.value = true;
        },);
      },
      child: ValueListenableBuilder(
        valueListenable: clickEffectNotifier,
        builder: (context, value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: widget.isEqualBtn ? 180 : 80,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.isEqualBtn? colorScheme.primary : colorScheme.secondary,
              borderRadius: BorderRadius.circular(35),
              boxShadow: value ? unClick() : clickEffect()
          ),
          child: CustomText(value: widget.value, color: widget.textColor),
        ),
      ),
    );
  }
}


unClick(){
  return [
    BoxShadow(
        offset: Offset(3, 3),
        color: Colors.black26,
        spreadRadius: 1,
        blurRadius: 5,
    ),
    BoxShadow(
        offset: Offset(-3, -3),
        color: Colors.white30,
        spreadRadius: 1,
        blurRadius: 5
    )
  ];
}

clickEffect(){
  return [
    BoxShadow(
        offset: Offset(0, 0),
        color: Colors.black26,
        spreadRadius: 0,
        blurRadius: 0,
    ),
    BoxShadow(
        offset: Offset(0, 0),
        color: Colors.white30,
        spreadRadius: 0,
        blurRadius: 0
    )
  ];
}