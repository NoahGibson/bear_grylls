import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';


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
    var f = File(imagePath);
    var body = f.readAsBytesSync();
    var uri = Uri.https('aiforearth.azure-api.net', '/species-recognition/v0.1/predict', queryParameters);
    Response response = await post(uri, headers: headers, body: body);  // check the status code for the result
    if (response.statusCode != 200) {
      return 'no name';
    }
    var responseBody = json.decode(response.body);
    String commonName = responseBody['predictions'][0]['species_common'];
    return commonName;
  }

  getSpecies(var imagePath) async {
    var species = await _makePostRequest(imagePath);
    return species;
  }
}
