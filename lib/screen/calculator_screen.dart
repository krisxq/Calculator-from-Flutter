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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
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
                      CustomBtn(value: 'AC', textColor: colorScheme.primary,),
                      CustomBtn(value: '7', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '4', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '1', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '%', textColor: colorScheme.tertiary,),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: '/', textColor: colorScheme.primary,),
                      CustomBtn(value: '8', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '5', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '2', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '0', textColor: colorScheme.tertiary,),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: 'x', textColor: colorScheme.primary,),
                      CustomBtn(value: '9', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '6', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '3', textColor: colorScheme.tertiary,),
                      CustomBtn(value: '.', textColor: colorScheme.tertiary,),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(value: 'Clr', textColor: colorScheme.primary,),
                      CustomBtn(value: '-', textColor: colorScheme.primary,),
                      CustomBtn(value: '+',textColor: colorScheme.primary,),
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
