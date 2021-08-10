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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome'),
            FlatButton(
              onPressed: () {},
              child: Text(
                  'click me'
              ),
              color: Colors.green,
            ),
            Container(
              color: Colors.cyan,
              // child: SizedBox(width: 20.0, height: 40.0,),
              child: Text('Inside a container'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome'),
            FlatButton(
              onPressed: () {},
              child: Text(
                  'click me'
              ),
              color: Colors.green,
            ),
            Container(
              color: Colors.cyan,
              // child: SizedBox(width: 20.0, height: 40.0,),
              child: Text('Inside a container'),
            ),
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
