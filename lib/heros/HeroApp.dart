import 'package:flutter/material.dart';
import 'MainScreen.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

