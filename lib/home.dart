import 'package:flutter/material.dart';

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