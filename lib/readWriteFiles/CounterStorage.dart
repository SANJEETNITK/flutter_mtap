import 'dart:async';
import 'dart:io';

import "package:path_provider/path_provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCountSp() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("Counter") ?? 0;
  }

  void writeCounterSp(int counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('Counter', counter);
  }

}
