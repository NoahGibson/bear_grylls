import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/services.dart' show rootBundle;


class SpeciesClassifier {
  var queryParameters = {
    'topK': '1',
    'predictMode': 'classifyAndDetect',
  };
  Map<String, String> headers = {
    'Content-Type': 'application/octet-stream',
    'Ocp-Apim-Subscription-Key': '485afbef61f9444bbcb4b454ef35d966'
  };

  _makePostRequest(var imagePath) async {  // set up POST request arguments
    //var f = File(imagePath);
    var bytes = await rootBundle.load("assets/image.jpg");
    final buffer = bytes.buffer;
    final body = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    //var body = f.readAsBytesSync();
    var uri = Uri.https('aiforearth.azure-api.net', '/species-recognition/v0.1/predict', queryParameters);
    Response response = await post(uri, headers: headers, body: body);  // check the status code for the result
    var responseBody = json.decode(response.body);
    String commonName = responseBody['predictions'][0]['species_common'];
    return commonName;
  }

  getSpecies(var imagePath) async {
    var species = await _makePostRequest(imagePath);
    return species;
  }
}
