import 'package:calculator/modules/theme_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/screen/calculator_screen.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ThemeProvider(),)
        ],
          child: const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.currentTheme,
        home: CalculatorScreen(),
      ),
    );
  }
}
