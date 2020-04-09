import 'dart:io';

import 'package:bear_grylls/services/animal_discovery.dart';
import 'package:bear_grylls/services/microsoft_species_classifier.dart';
import 'package:bear_grylls/services/plant_discovery.dart';
import 'package:bear_grylls/services/species_classifier_adaptor.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widgets/box_container.dart';
import 'dart:math';

Random random = Random();
double randomNumber = (random.nextDouble()/2);

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
  double dangerous = randomNumber;
  Future<void> _initializeDetailsFuture;
  bool _detailsAreInitialized;


  void _getAnimalName(String imagePath) async {
    SpeciesClassifierAdaptor speciesClassifier = MicrosoftSpeciesClassifier();
    var animalDetails = await speciesClassifier.getSpecies(imagePath);
    kingdomName = animalDetails[0];
    animalName = animalDetails[1];
    if(animalName.contains("Alligator") || animalName.contains("Crocodile") || animalName.contains("Bear") || animalName.contains("Wolf")|| animalName.contains("Shark")){
      dangerous = 0.8;
    }
  }

  void _getAnimalDetails(String animalName, String kingdomName) async {
    String lowerCaseKingdom = kingdomName.toLowerCase();
    if (lowerCaseKingdom == "animals") {
      animalDetails = await AnimalDiscovery().getFacts(animalName);
    } else if (lowerCaseKingdom == "plants") {
      animalDetails = await PlantDiscovery().getFacts(animalName);
    } else {
      print("No known kingdom name found; defaulting to Animals");
      animalDetails = await AnimalDiscovery().getFacts(animalName);
    }
    if (animalDetails.contains("dangerous") ||
        animalDetails.contains("danger") || animalDetails.contains("posion") ||
        animalDetails.contains("posionous") ||
        animalDetails.contains("large") || animalDetails.contains("big") ||
        animalDetails.contains("aggresion") ||
        animalDetails.contains("aggresive") ||
        animalDetails.contains("attacks")){
      dangerous = 0.7;
  }
  }

  Future<void> _initScreenInfo() async {
    await _getAnimalName(widget.imagePath);
    if (animalName != "Not recognized") {
      await _getAnimalDetails(animalName, kingdomName);
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
      body: Stack(
        alignment: FractionalOffset.center,
        children: <Widget>[

          Positioned.fill(
            child: Image.file(File(widget.imagePath)),
          ),

          FutureBuilder<void>(
            future: _initializeDetailsFuture,
            builder: (context, snapshot) {
              if (!_detailsAreInitialized) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  alignment: FractionalOffset.center,
                  child: Stack(
                    children: <Widget>[

                      Positioned(
                        top: 40,
                        right: 30,
                        left: 30,
                        child: BoxContainer(
                            height: 100,
                            width: 300,
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  animalName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              LinearPercentIndicator(
                                width: 210.0,
                                animation: true,
                                lineHeight: 20.0,
                                leading: Text("  Friendly ", style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                                trailing: Text(" Dangerous", style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                                animationDuration: 2000,
                                percent: dangerous,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.lightBlue[100],
                              ),
                            ]
                          )
                        ),
                      ),


                      Positioned(
                        bottom: 430,
                        left: 70,
                        right: 70,
                        child: BoxContainer(
                          width: 220,
                          height: 30,
                          child: Center(
                            child: Text(
                              "Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ),

                      Positioned(
                        bottom: 30,
                        left: 30,
                        right: 30,
                        child: BoxContainer(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                animalDetails,
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ),
                          height: 390,
                          width: 300
                        ),
                      ),

                    ],
                  )
                );
              }
            },
          ),

        ],
      )
    );
  }
}