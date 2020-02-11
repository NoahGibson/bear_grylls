import 'dart:io';

import 'package:flutter/material.dart';

class PictureDetailsScreen extends StatelessWidget {

  final String imagePath;
  const PictureDetailsScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Center(
        child: Image.file(File(imagePath))
      )
    );
  }
}