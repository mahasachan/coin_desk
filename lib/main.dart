import 'package:flutter/material.dart';

void main() {}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 119, 176, 170),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coin Desk',
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            )));
  }
}
