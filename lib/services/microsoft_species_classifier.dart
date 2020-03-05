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
    'topK': '1',
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
    if (response.statusCode != 200) {
      return 'no name';
    }
    final responseBody = json.decode(response.body);
    final kingdom = responseBody['predictions'][0]['kingdom_common'];
    final commonName = responseBody['predictions'][0]['species_common'];
    return [kingdom, commonName];
  }
}
