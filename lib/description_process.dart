//input: description. Output:animal

import 'package:flutter/material.dart';
import 'package:bear_grylls/facts.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

//void main() => runApp(MyApp());
Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: FirstRoute(
        // Pass the appropriate camera to the TakePictureScreen widget.
        //camera: firstCamera,
      ),
    ),
  );
}

class FirstRoute extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polar Bear!"),
      ),
      body: Center(
          child: RaisedButton(
            //onPressed: () {
            //   Navigator.pop(context);
            //},
            //child: Text('Go back!'),
            //)
            child:Image.asset(
              'Images/BEAR.jpg',
              width: 600,
              height: 500,
              //fit: BoxFit.cover,
            ),
          )
      ),
    );
  }
}