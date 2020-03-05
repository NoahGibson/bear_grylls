import 'dart:io';

import 'package:bear_grylls/services/animal_discovery.dart';
import 'package:bear_grylls/services/microsoft_species_classifier.dart';
import 'package:bear_grylls/services/species_classifier_adaptor.dart';
import 'package:flutter/material.dart';

class PictureDetailsScreen extends StatefulWidget {
  final String imagePath;

  PictureDetailsScreen({Key key, @required this.imagePath}) : super(key: key);

  @override
  _PictureDetailsScreenState createState() => _PictureDetailsScreenState();
}

class _PictureDetailsScreenState extends State<PictureDetailsScreen> {

  String animalName = "";
  String kingdomName = "";
  String animalDetails = "";
  Future<void> _initializeDetailsFuture;
  bool _detailsAreInitialized;

  void _getAnimalName(String imagePath) async {
    SpeciesClassifierAdaptor speciesClassifier = MicrosoftSpeciesClassifier();
    var animalDetails = await speciesClassifier.getSpecies(imagePath);
    kingdomName = animalDetails[0];
    animalName = animalDetails[1];
  }

  void _getAnimalDetails(String animalName) async {
    animalDetails = await AnimalDiscovery().getFacts(animalName);
  }

  Future<void> _initScreenInfo() async {
    await _getAnimalName(widget.imagePath);
    if (animalName != "no name") {
      await _getAnimalDetails(animalName);
    }
    _detailsAreInitialized = true;
  }

  @override
  void initState() {
    super.initState();

    _detailsAreInitialized = false;
    _initializeDetailsFuture = _initScreenInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: FutureBuilder<void>(
        future: _initializeDetailsFuture,
        builder: (context, snapshot) {
          if (!_detailsAreInitialized) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Container(
                child: Column(

                  children: <Widget>[

                    Image.file(File(widget.imagePath),
                      width: 200.0,
                    ),

                    Text(
                      'Identified as a: ' + animalName,
                      style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      animalDetails,
                      style: TextStyle(height: 2, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            );
          }
        }
      )
    );
  }
}