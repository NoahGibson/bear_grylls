import 'package:flutter/material.dart';
import 'package:bear_grylls/facts.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'camera.dart' as camera;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bear Grylls'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Take a Picture'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => camera.TakePictureScreen()),
            );
          },
        ),
      ),
    );
  }
}