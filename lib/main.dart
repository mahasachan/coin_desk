import 'package:coin_desk/controller/bitcoin_provider.dart';
import 'package:coin_desk/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

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
            )),
        home: SafeArea(
          child: ChangeNotifierProvider(
              create: (_) => BitcoinDataProvider(), child: const MyHomePage()),
        ));
  }
}
