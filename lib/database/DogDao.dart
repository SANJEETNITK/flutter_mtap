import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Dog.dart';

import 'dart:io';

class DogDao {

  var database;

  DogDao() {
    openDb();
  }

  Future<Database> openDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'dogdb'),
      version: 1,
      onCreate: (db, version) {
      String sql = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';
      db.execute(sql);
      }
    );
    return database;
  }

  // static DogDao? _dogDao;
  // static Database? _database;
  //
  // factory DogDao(){
  //   if(_dogDao == null){
  //     _dogDao = new DogDao();
  //   }
  //   return _dogDao!;
  // }
  //
  // Future<Database> get database async{
  //   if(_database == null){
  //     _database = await initializeDatabase();
  //   }
  //   return _database!;
  // }
  //
  //  Future<Database> initializeDatabase() async{
  //   var _database = await openDatabase(
  //       join(await getDatabasesPath(), 'dogdb'),
  //       version: 1,
  //       onCreate: _createDb
  //   );
  //   return _database;
  // }
  //
  // void _createDb(Database db, int newVersion) async {
  //   String sql = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';
  //   await db.execute(sql);
  // }


  // CRUD
  Future<void> insertDog(Dog dog) async{
    final db = await this.database;
    int position = await db.insert('dogs',
        dog.toMap(), nullColumnHack: null, conflictAlgorithm: ConflictAlgorithm.replace);
    print('inserted dog');
  }

  Future<List<Dog>> getDogs() async{
    final db = await this.database;

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

}