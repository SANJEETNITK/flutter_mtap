import 'package:flutter/material.dart';
import 'package:flutter_mtap/database/DatabaseHelper.dart';
import 'package:flutter_mtap/database/DogDao.dart';
import 'package:flutter_mtap/database/ListDogScreen.dart';
import 'package:sqflite/sqflite.dart';

import 'Dog.dart';

DogDao _dogDao = new DogDao();
var database;

void main(){
  // database = _dogDao.openDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/dogsList": (context) => ListDogApp(),
      },
      home: DogApp(),
    );
  }
}

class DogApp extends StatefulWidget {
  @override
  _DogAppState createState() => _DogAppState();
}

class _DogAppState extends State<DogApp> {

  TextEditingController idController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  DogDao _dogDao = new DogDao();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    //child: Image.network("https://www.pexels.com/photo/short-coated-tan-dog-2253275/"),
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/flutter-logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: idController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                    hintText: 'Enter id of the dog'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter name of the dog'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: ageController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter age of the dog'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  _addDog();
                },
                child: Text(
                  'Add to Database',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/dogsList',
                    arguments: _getDogs(),
                  );

                  // Navigator.pushNamed(
                  //   context,
                  //   '/dogsList',
                  // );
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => GetList(),
                  // ));
                  _showDogs();
                },
                child: Text(
                  'Show dogs list',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addDog() {

    int id = int.parse(idController.text);
    String name = nameController.text;
    int age = int.parse(ageController.text);

    // print(int.parse(idController.text));
    // print(nameController.text);
    // print(int.parse(ageController.text));

    Dog dog = Dog(id: id, name: name, age: age);
    // _dogDao.insertDog(dog);

    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.insertDog(dog);

    idController.text = "";
    nameController.text = "";
    ageController.text = "";
  }

  void _showDogs() async {
    // List<Dog> list = await _dogDao.getDogs();
    // return list;

    List<Dog> list = await _getDogs();
    print(list);
  }

  Future<List<Dog>> _getDogs() async {

    DatabaseHelper databaseHelper = DatabaseHelper();
    List<Dog> list = await databaseHelper.getDogs();
    return list;
  }

}