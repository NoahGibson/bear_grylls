import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curl/curl.dart';

void main () async {
  var queryParameters = {
    'version': '2019-04-30',
    'query': 'enriched_text.concepts.text:Bird'
  };

  String url = "api.us-south.discovery.watson.cloud.ibm.com";
  String headers = "/instances/9fcebfcb-765f-4ef8-9618-4ab148862d33/v1/environments/1ce96b1a-ef48-4f22-8613-3db8bb725904/collections/7ab9bea4-f660-471f-bf96-6d14f67a1542/query";

  //Uri.https(url, '/api/v1/test/${widget.pk}', queryParameters);
  var uri =
  Uri.https(url, headers, queryParameters);
  final key = "938po7EKhtG8cvKMOhuVdaJ7IS5VY3MpR5PCZAiq_neM";

  //final req1 = new http.MultipartRequest("GET", uri);

//  var response = await http.get(uri);

  var response = await http.get(uri, headers:{
    'Authorization': 'Basic'  + base64.encode(utf8.encode("apikey:"+ key))
  });

  print(response.body);
}




/* http.get(uri, headers: {
    HttpHeaders.authorizationHeader: 'Token $token',
    HttpHeaders.contentTypeHeader: 'application/json',
  });
 */































//Future<Post> fetchPost() async {
/* final response =
  await http.get('https://api.us-south.discovery.watson.cloud.ibm.com/instances/9fcebfcb-765f-4ef8-9618-4ab148862d33');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String apikey;
  final String collectionid;
  final String configurationid;
  final String environmentid;

  Post({this.apikey, this.collectionid, this.configurationid, this.environmentid});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      apikey: json['938po7EKhtG8cvKMOhuVdaJ7IS5VY3MpR5PCZAiq_neM'],
      collectionid: json['7ab9bea4-f660-471f-bf96-6d14f67a1542'],
      configurationid: json['be20f0ce-f939-415b-b9ce-8e5696eef4e7'],
      environmentid: json['1ce96b1a-ef48-4f22-8613-3db8bb725904'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}



var queryParameters = {
  'param1': 'one',
  'param2': 'two',
};
var uri =
    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
var response = await http.get(uri, headers: {
  HttpHeaders.authorizationHeader: 'Token $token',
  HttpHeaders.contentTypeHeader: 'application/json',
});
 */