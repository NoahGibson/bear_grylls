import 'dart:convert';
import 'package:http/http.dart' as http;

class PlantDiscovery {
  String url = "api.us-east.discovery.watson.cloud.ibm.com";
  String headers = "/instances/ae2ba8e5-5b2a-4cd0-b788-6d83bbfbb1f7/v1/environments/1662e788-3454-452b-87f7-f34d65929933/collections/93ee0fda-ec8b-4ff2-bf1f-db61596f4b29/query";

  _getQueryParameters(String plantName) {
    return {
      'version': '2019-04-30',
      'query': 'enriched_text.concepts.text:' + plantName
    };
  }

  getFacts(String plantName) async{
    var uri = Uri.https(url, headers, _getQueryParameters(plantName));
    final key = "-lDAnavp1Oe2IMQjU4-mCvFxoTLM9xyeOlp0YoScUkkM";
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

//void main() {
//  String info = PlantDiscovery().getFacts("Lemon");
//  print(info);
//}