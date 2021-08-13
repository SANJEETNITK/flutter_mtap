
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Dog.dart';

class DatabaseHelper {
    static DatabaseHelper? _databaseHelper;
    static Database? _database;

    DatabaseHelper._createInstance();

    factory DatabaseHelper() {
      if (_databaseHelper == null) {
        _databaseHelper = DatabaseHelper._createInstance();
      }
      return _databaseHelper!;
    }

    Future<Database> get database async{
      if (_database == null) {
        _database = await initializeDatabase();
      }
      return _database!;
    }

    Future<Database> initializeDatabase() async{
      var database = await openDatabase(join(await getDatabasesPath(), 'dogdb'), version: 1, onCreate: _createDb);
      return database;
    }

    void _createDb(Database db, int newVersion) async {
      String sql = 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';
      await db.execute(sql);
    }

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