import 'dart:io';

import 'package:flutter/material.dart';
//import '../../services/classify_species.dart' as classify;

class PictureDetailsScreen extends StatelessWidget {

  final String imagePath;
  final String animalName="";
  //static String animalName=classify.SpeciesClassifier().getSpecies(imagePath);
  final String details=" ";
  const PictureDetailsScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Container(
        child: Column(

          children: <Widget>[

            Image.file(File(imagePath),
              width: 200.0,
            ),

            Text(
              'Identified as a: ' + animalName,
              style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),

            Text(
              'Species details: ' + details,
              style: TextStyle(height: 2, fontSize: 20),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
      /*body: Center(
        child: Image.file(File(imagePath))
      )*/
    );
  }
}