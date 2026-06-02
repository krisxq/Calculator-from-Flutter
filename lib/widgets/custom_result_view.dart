import 'package:calculator/modules/theme_module.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/widgets/custom_text.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/result_value_model.dart';

class CustomResultView extends StatelessWidget {
  const CustomResultView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70), //toggle button padding
          child: SizedBox(
            height: 60,
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => DayNightSwitch(
                value: ThemeData.dark() == themeProvider.currentTheme,
                onChanged: (changedTheme) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
          ),
        ),
        Spacer(),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(35), //result view border radius
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(-3, -3),
                blurRadius: 8,
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                spreadRadius: -1,
                color: Colors.white,
                offset: Offset(3, 3),
                blurRadius: 8,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<ResultValueProvider>(
              builder: (context, resultValueProvider, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    value: resultValueProvider.getDetailView,
                    color: colorScheme.tertiary,
                    size: 50,
                  ),
                  CustomText(
                    value: resultValueProvider.getResultView,
                    color: colorScheme.primary,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
