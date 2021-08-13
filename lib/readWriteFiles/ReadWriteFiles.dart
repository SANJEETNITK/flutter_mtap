import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mtap/readWriteFiles/FilesDemo.dart';
import "package:path_provider/path_provider.dart";

import 'CounterStorage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FilesDemo(storage: CounterStorage()),
    ),
  );
}