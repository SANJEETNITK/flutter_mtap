import 'package:flutter/material.dart';

import 'model/ScreenArguments.dart';

// A Widget that extracts the necessary arguments from
// the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {

  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
