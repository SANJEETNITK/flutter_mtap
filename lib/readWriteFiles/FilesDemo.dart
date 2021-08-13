import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'CounterStorage.dart';

class FilesDemo extends StatefulWidget {
  const FilesDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FilesDemoState createState() => _FilesDemoState();
}

class _FilesDemoState extends State<FilesDemo> {
  int _counter = 0;
  int _counterSp = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
    setCounterSp();
  }

  void setCounterSp() async{
    _counterSp = await widget.storage.readCountSp();
  }

  Future<int> get _getCounterSp async {
    int val = await widget.storage.readCountSp();
    return val;
  }

  void _incrementCounterSp() {
    setState(() {
      _counterSp += 1;
      widget.storage.writeCounter(_counterSp);
    });

  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          // For files
          // 'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',

          // For sharedPrefences
          'Button tapped $_counterSp time${_counterSp == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // For files
        // onPressed: _incrementCounter,

        // For SharedPreferences
        onPressed: _incrementCounterSp,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}