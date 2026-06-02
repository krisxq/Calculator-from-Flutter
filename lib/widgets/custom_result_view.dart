import 'package:calculator/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomResultView extends StatelessWidget {
  const CustomResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.greyWhiteColor,
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
