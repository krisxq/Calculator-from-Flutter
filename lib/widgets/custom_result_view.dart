import 'package:calculator/modules/theme_module.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomResultView extends StatelessWidget {
  const CustomResultView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            height: 60,
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => DayNightSwitch(
                value: ThemeData.dark() == themeProvider.currentTheme,
                onChanged: (changedTheme){
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
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(-3, -3),
                blurRadius: 8,
                blurStyle: BlurStyle.inner
              ),
              BoxShadow(
                spreadRadius: -1,
                  color: Colors.white,
                  offset: Offset(3, 3),
                  blurRadius: 8,
                  blurStyle: BlurStyle.inner
              ),
            ]
          ),
        )
      ],
    );
  }
}
