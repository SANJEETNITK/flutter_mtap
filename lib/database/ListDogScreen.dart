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
  final List<int> ids = <int>[0, 1, 2, 3, 4, 5, 6,  7, 8];
  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];

  // DogDao dogDao = new DogDao();
  // Database database = DogDao().openDb() as Database;

  // List<Dog> dogs = dogDao.getDogs();
  // List<Dog> dogs = await dogDao.getDogs();

  Future<List<Dog>> _getDogsList() async {
    DatabaseHelper _databaseHelper = new DatabaseHelper();
    List<Dog> dogsList = await _databaseHelper.getDogs();
    return dogsList;
  }


  @override
  Widget build(BuildContext context) {

    var dogsList = _getDogsList() as List<Dog>;

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial - googleflutter.com'),
        ),
        body: ListView.builder(
          itemCount: dogsList.length ,
          itemBuilder: (BuildContext context,int index){
            return new ListTile(
              title: new Text(
                dogsList[index].name +
                    "                    " +
                    dogsList[index].id.toString() +
                    "                    " +
                    dogsList[index].age.toString(),
              ),
            );
          }
        ),
        // body: FutureBuilder<List>(
        //     future: dogDao.getDogs(),
        //     initialData: [],
        //     builder: (context, snapshot) {
        //       return snapshot.hasData
        //           ? new ListView.builder(                             //if
        //         padding: const EdgeInsets.all(10.0),
        //         itemCount: snapshot.data!.length,
        //         itemBuilder: (context, i) {
        //           return _buildRow(snapshot.data![i]);
        //         },
        //       )
        //           : Center(                                         //else
        //         child: CircularProgressIndicator(),
        //       );
        //     // itemBuilder: (BuildContext context, int index) {
        //     //   return Container(
        //     //     height: 50,
        //     //     margin: EdgeInsets.all(2),
        //     //     child: Row(
        //     //         children: [
        //     //           // Text('${dogs[index]}'),
        //     //           Text('${ids[index]} ${names[index]} (${msgCount[index]})',
        //     //             style: TextStyle(fontSize: 18),
        //     //           )
        //     //         ],
        //     //     ),
        //     //   );
        //     }
        // )
    );
  }

  Widget _buildRow(Dog dog) {
    return new ListTile(
      title: new Text(
          dog.name +
              "                    " +
              dog.id.toString() +
              "                    " +
              dog.age.toString(),
          ),
    );
  }
}