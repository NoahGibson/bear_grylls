import 'dart:io';
import 'dart:convert';
void main() {
  HttpClient()
      .getUrl(Uri.parse('https://api.us-south.discovery.watson.cloud.ibm.com/instances/9fcebfcb-765f-4ef8-9618-4ab148862d33')) // produces a request object
      .then((request) => request.close()) // sends the request
      .then((response) =>
      response.transform(Utf8Decoder()).listen(print)); // transforms and prints the response
}