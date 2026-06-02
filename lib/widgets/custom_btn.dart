import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        clickEffectNotifier.value = false;
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
              color: widget.isEqualBtn? AppColors.blueColor : AppColors.greyWhiteColor,
              borderRadius: BorderRadius.circular(24),
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