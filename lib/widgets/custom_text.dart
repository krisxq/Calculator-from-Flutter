import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String value;
  final Color color;
  final double size;

  const CustomText({
    super.key,
    required this.value,
    required this.color,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
