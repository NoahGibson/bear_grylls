import 'dart:convert';
import 'package:http/http.dart' as http;

class AnimalDiscovery {
  String url = "api.us-south.discovery.watson.cloud.ibm.com";
  String headers = "/instances/9fcebfcb-765f-4ef8-9618-4ab148862d33/v1/environments/1ce96b1a-ef48-4f22-8613-3db8bb725904/collections/7ab9bea4-f660-471f-bf96-6d14f67a1542/query";

  _getQueryParameters(String animalName) {
    return {
      'version': '2019-04-30',
      'query': 'enriched_text.concepts.text:' + animalName
    };
  }

  getFacts(String animalName) async{
    var uri = Uri.https(url, headers, _getQueryParameters(animalName));
    final key = "938po7EKhtG8cvKMOhuVdaJ7IS5VY3MpR5PCZAiq_neM";
    var response = await http.get(uri, headers: {
      'Authorization': 'Basic ' + base64.encode(utf8.encode("apikey:" + key))
    });
    var responseBody = json.decode(response.body);
    var responseResults = responseBody['results'];

    if (responseResults.isEmpty) {
      return 'No Information Found';
    } else {
      return responseResults[0]['text'];
    }
  }
}
