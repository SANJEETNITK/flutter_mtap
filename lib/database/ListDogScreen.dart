// import 'dart:async';
// import 'dart:developer';
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'Dog.dart';
// import 'DogDao.dart';
//
// var dogDao = new DogDao();
// var database;
//
// void main() {
//   database = dogDao.openDb();
//   runApp(new GetList());
// }
//
// class GetList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: "List in Flutter",
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: Text("List Of Dogs"),
//         ),
//         body: RandomFruits(),
//       ),
//     );
//   }
// }
//
// class RandomFruits extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new RandomFruitsState();
//   }
// }
//
// class RandomFruitsState extends State<RandomFruits> {
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder<List>(
//           future: dogDao.getDogs(),
//           initialData: [],
//           builder: (context, snapshot) {
//             return snapshot.hasData
//                 ? new ListView.builder(                             //if
//               padding: const EdgeInsets.all(10.0),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, i) {
//                 return _buildRow(snapshot.data![i]);
//               },
//             )
//                 : Center(                                         //else
//               child: CircularProgressIndicator(),
//             );
//           },
//         ));
//   }
//
//   Widget _buildRow(Dog fruit) {
//     return new ListTile(
//       title: new Text(
//           fruit.name +
//               "                    " +
//               fruit.id.toString() +
//               "                    " +
//               fruit.age.toString(),
//           style: _biggerFont),
//     );
//   }
// }









import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mtap/database/DatabaseHelper.dart';
import 'package:flutter_mtap/database/Dog.dart';
import 'package:flutter_mtap/database/DogDao.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

DogDao dogDao = new DogDao();
// var database;

void main() {
  // database = dogDao.openDb();
  print("main created");
  runApp(MaterialApp(
    home: ListDogApp(),
  ));
}

class ListDogApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListDogApp> {

  List<Dog> dogsList = <Dog>[];

  void _setDogsList() async {
    _getDogsList().then((value) => setState((){
      this.dogsList = value;
    }));
  }

  Future<List<Dog>> _getDogsList() async{
    DatabaseHelper _databaseHelper = new DatabaseHelper();
    return await _databaseHelper.getDogs();
  }

  @override
  Widget build(BuildContext context) {

    // List<Dog> dogsList = ModalRoute.of(context)!.settings.arguments as List<Dog>;
    _setDogsList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Dogs list + ${dogsList.length}'),
        ),
        body: ListView.builder(
          itemCount: dogsList.length,
          itemBuilder: (BuildContext context,int index){
            // return new ListTile(
            //   title: new Text(
            //     dogsList[index].name +
            //      " " +
            //         dogsList[index].id.toString() +
            //         " " +
            //         dogsList[index].age.toString(),
            //   ),
            // );
            return new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dogsList[index].id.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dogsList[index].name,
                    style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  dogsList[index].age.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          }
        ),
    );
  }

}