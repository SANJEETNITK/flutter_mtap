import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

// This widget is the
// root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Flutter Toast"),
        backgroundColor: Colors.green,
      ),
      body:Center(
          child:
          FlatButton(child: Text("Show toast",style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){
                Fluttertoast.showToast(
                  msg: "This is a flutter toast.",
                  // backgroundColor: Colors.grey,
                  // toastLength: Toast.LENGTH_LONG,
                  // fontSize: 25,
                  // gravity: ToastGravity.CENTER,
                  // textColor: Colors.pink,
                );})
      ),
    );
  }
}

