import 'dart:io';

import 'package:flutter/material.dart';

class PictureDetailScreen extends StatelessWidget {

  final String imagePath;
  const PictureDetailScreen({Key key, this.imagePath}) : super(key: key);

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