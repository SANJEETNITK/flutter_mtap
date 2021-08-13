import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Dog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'dogdb'),
    version: 1,
    onCreate: (db, version) {
      String sql = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';
      db.execute(sql);
    }
  );

  // CRUD
  Future<void> insertDog(Dog dog) async{
    final db = await database;
    int position = await db.insert('dogs',
        dog.toMap(), nullColumnHack: null, conflictAlgorithm: ConflictAlgorithm.replace);
    print('inserted dog');
  }

  Future<List<Dog>> getDogs() async{
    final db = await database;

    List<Map<String, dynamic>> mapRows = await db.query('dogs');
    return List.generate(mapRows.length, (index) {
      var dog =  Dog(
        id: mapRows[index]['id'],
        name: mapRows[index]['name'],
        age: mapRows[index]['age'],
      );
      print(dog.toString());
      return dog;
    });

  }

  Future<int> updateDog(Dog dog) async{
    final db = await database;
    int noOfDogsRowsAffected = await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
    return noOfDogsRowsAffected;
  }

  void deleteDog(Dog dog) async{
    final db = await database;
    int rowPosition = await db.delete('dogs', where: 'id = ?', whereArgs: [dog.id]);
  }

  Dog pomerian = Dog(id: 1, name: 'Pomerian puppy', age: 2);
  await insertDog(pomerian);
  await getDogs();
}
