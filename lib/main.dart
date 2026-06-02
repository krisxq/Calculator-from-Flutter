import 'package:calculator/modules/result_value_model.dart';
import 'package:calculator/modules/theme_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/screen/calculator_screen.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ThemeProvider(),),
          ChangeNotifierProvider(
            create: (_) => ResultValueProvider(resultView: "", detailView: "")),
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
