import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/widgets/custom_btn.dart';
import 'package:calculator/widgets/custom_result_view.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomResultView()
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: 'AC', textColor: AppColors.blueColor,),
                      CustomBtn(value: '7',),
                      CustomBtn(value: '4',),
                      CustomBtn(value: '1',),
                      CustomBtn(value: '%',),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: '/', textColor: AppColors.blueColor,),
                      CustomBtn(value: '8',),
                      CustomBtn(value: '5',),
                      CustomBtn(value: '2',),
                      CustomBtn(value: '0',),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: 'x', textColor: AppColors.blueColor,),
                      CustomBtn(value: '9',),
                      CustomBtn(value: '6',),
                      CustomBtn(value: '3',),
                      CustomBtn(value: '.',),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: 'Clr', textColor: AppColors.blueColor,),
                      CustomBtn(value: '-', textColor: AppColors.blueColor,),
                      CustomBtn(value: '+',textColor: AppColors.blueColor,),
                      CustomBtn(
                        value: '=',
                        textColor: AppColors.whiteColor,
                        isEqualBtn: true,
                      ),
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}
