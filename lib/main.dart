import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    // home: Scaffold(
    // appBar: AppBar(
    // title: Text(
    // 'my first app',
    // style: TextStyle(
    //     fontSize: 20.0,
    //     letterSpacing: 2.0,
    //     fontFamily: 'IndieFlower',
    //     color: Colors.red,

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
      body: Container(

          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          color: Colors.green,
          child: Center(
              child: RaisedButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.airport_shuttle),
                  label: Text('mail me'))
          ),
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
