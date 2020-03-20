import 'package:flutter/material.dart';

import '../take_picture_screen/take_picture_screen.dart' as camera;

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Bear Grylls'),
          key: Key('BearGryllsTest1')),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(('Take a Picture'),
            key: Key('takeAPicTest')),
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