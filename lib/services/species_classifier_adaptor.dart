import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

abstract class SpeciesClassifierAdaptor {
  @protected
  makePostRequest(String imagePath);

  @protected
  parseResponse(Response response);

  getSpecies(String imagePath) async {
    final response = await makePostRequest(imagePath);
    final species = parseResponse(response);
    return species;
  }
}