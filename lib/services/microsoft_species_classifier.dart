import 'dart:convert';
import 'dart:io';

import 'package:bear_grylls/services/species_classifier_adaptor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';


class MicrosoftSpeciesClassifier extends SpeciesClassifierAdaptor{
  var headers = {
    'Content-Type': 'application/octet-stream',
    'Ocp-Apim-Subscription-Key': 'temp'
  };

  final queryParameters = {
    'topK': '2',
    'predictMode': 'classifyAndDetect',
  };

  Future<String> loadAsset() async {
    return await rootBundle.loadStructuredData('assets/config.json', (value) async {
      final asset = json.decode(value)['MICROSOFT_API_KEY'];
      return asset;
    });
  }

  @override
  makePostRequest(String imagePath) async {  // set up POST request arguments
    final imageFile = File(imagePath);
    final body = imageFile.readAsBytesSync();
    final uri = Uri.https('aiforearth.azure-api.net', '/species-recognition/v0.1/predict', queryParameters);
    headers['Ocp-Apim-Subscription-Key'] = await loadAsset();
    final response = await post(uri, headers: headers, body: body);

    return response;
  }

  @override
  parseResponse(Response response) {
    var kingdom = '';
    var commonName = '';
    if (response.statusCode != 200) {
      return [kingdom, commonName];
    }
    final responseBody = json.decode(response.body);
    final confidence = responseBody['predictions'][0]['confidence'] + responseBody['predictions'][1]['confidence'];
    if (confidence >= 40) {
      kingdom = responseBody['predictions'][0]['kingdom_common'];
      commonName = responseBody['predictions'][0]['species_common'];
    }
    return [kingdom, commonName];
  }
}
