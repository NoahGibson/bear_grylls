import 'package:flutter/material.dart';

import 'home.dart' as home;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bear Grylls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home.HomePage(),
    );
  }
}
