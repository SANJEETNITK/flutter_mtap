import 'package:flutter/material.dart';
import 'package:flutter_mtap/extractArguments/userDetails/UserDetails.dart';
import 'package:flutter_mtap/passAndExtractArguments/model/ScreenArguments.dart';
import 'package:flutter_mtap/passAndExtractArguments/routes/Routes.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  UserDetails _userDetails = UserDetails('Sanjeet', 20,);
  ScreenArguments _screenArguments = ScreenArguments("Extract argument screen", "Message from home screen");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A button that navigates to a named route.
            // The named route extracts the arguments
            // by itself.
            ElevatedButton(
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(context,
                  Routes.extractArgumentRouteName,
                  arguments: _screenArguments,
                  // arguments: _userDetails,
                );
              },
              child: const Text('Navigate to screen that extracts arguments'),
            ),
          ],
        ),
      ),
    );
  }
}