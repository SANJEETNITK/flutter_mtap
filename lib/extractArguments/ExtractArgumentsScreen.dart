import 'package:flutter/material.dart';
import 'package:flutter_mtap/extractArguments/userDetails/UserDetails.dart';
import 'package:flutter_mtap/passAndExtractArguments/model/ScreenArguments.dart';


// A Widget that extracts the necessary arguments from
// the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {

  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.

    if(ModalRoute.of(context)!.settings.arguments == null){
      return errorPage("No arguments passed");
    }

    if(ModalRoute.of(context)!.settings.arguments is UserDetails){
      final userDetails = ModalRoute.of(context)!.settings.arguments as UserDetails;

      return Scaffold(
        appBar: AppBar(
          title: Text(userDetails.name),
        ),
        body: Center(
          child: Text(
            "Hi, my name is " + userDetails.name + " and my age is " + userDetails.age.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
      );
    }

    if(ModalRoute.of(context)!.settings.arguments is ScreenArguments){
      final screenArguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

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

    return errorPage("Something went wrong.");
  }

  Widget errorPage(String errorMessage){
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
