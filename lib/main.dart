import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: MyApp()
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(
        'my first app',
        style: TextStyle(
        fontSize: 20.0,
        letterSpacing: 2.0,
        fontFamily: 'IndieFlower',
        color: Colors.red,
    ),
    ),
    centerTitle: true,
    ),
    // body: Padding(
    //   padding: EdgeInsets.all(20.0),
    //   child: Text(
    //     'Hello',
    //     style: TextStyle(
    //       backgroundColor: Colors.blue,
    //       color: Colors.white
    //     ),
    //   ),
    // ),

    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: 300,
              height: 60,
              child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),

                ),
              ),
          ],
        ),
        Row(
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                ),
              ),

            )
          ],
        ),
      ],
    ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Text('press',
          style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'IndieFlower',
          color: Colors.red,
        ),
        ),
        onPressed: () {  },

      ),
    );

  }
}


