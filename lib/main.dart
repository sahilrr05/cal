import 'package:flutter/material.dart';
import 'Homep.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sahil',
      theme:
      ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Homep(),
    );
  }
}
