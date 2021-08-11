import 'package:flutter/material.dart';
import 'package:flutter_mtap/passAndExtractArguments/routes/Routes.dart';

import 'HomeScreen.dart';
import 'ExtractArgumentsScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.extractArgumentRouteName : (context) => ExtractArgumentsScreen(),
        Routes.homeRouteName : (context) => HomeScreen(),
      },
      title: 'Navigation with Arguments',
      initialRoute: Routes.homeRouteName,
    );
  }
}



