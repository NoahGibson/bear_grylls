//either description or image

import 'package:flutter/material.dart';
import 'package:bear_grylls/facts.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'camera.dart' as camera;
import 'facts.dart' as facts;
import 'image_process.dart' as image_process;
import 'description_process.dart' as description_process;

//void main() => runApp(MyApp());

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      title: 'Bear Grylls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: camera.TakePictureScreen(
          camera: firstCamera
      ),

    )
  );
}