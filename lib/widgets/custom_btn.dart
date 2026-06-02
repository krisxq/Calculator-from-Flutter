import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  const CustomBtn({super.key});

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
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.greyWhiteColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: value ? unClick() : clickEffect()
          ),
          child: CustomText(value: '12', color: AppColors.blackColor),
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