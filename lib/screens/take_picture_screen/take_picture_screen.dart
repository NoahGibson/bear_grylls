import 'dart:async';

import 'package:bear_grylls/widgets/box_container.dart';
import 'package:bear_grylls/services/classify_species.dart';

import 'widgets/capture_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import '../picture_details_screen/picture_details_screen.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller.dispose();
    }

    _controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (_controller.value.hasError) {
        print('Camera error ${_controller.value.errorDescription}');
      }
    });

    try {
      _initializeControllerFuture = _controller.initialize();
      await _initializeControllerFuture;
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _captureImage() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Construct the path where the image should be saved using the
      // pattern package.
      final path = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Attempt to take a picture and log where it's been saved.
      await _controller.takePicture(path);

      var sc = SpeciesClassifier();
      var species = await sc.getSpecies(path);
      print(species); // Not actually needed but makes the analyzer happy

      // If the picture was taken, display it on a new screen.
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PictureDetailsScreen(imagePath: path),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    
    availableCameras().then((availableCameras) {
      if (availableCameras.isNotEmpty) {
        _initCameraController(availableCameras[0]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (_controller == null || ! _controller.value.isInitialized) {
            // If camera not ready, display loading indicator
            return Center(child: CircularProgressIndicator());
          } else {
            // If the Future is complete, display the preview.
            return Stack(
              alignment: FractionalOffset.center,
              children: <Widget>[
                Positioned.fill(
                  child: CameraPreview(_controller),
                ),
                Positioned(
                  top: 30,
                  child: BoxContainer(
                    width: 220,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Enter a Description",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ),
                Positioned(
                  top: 65,
                  child: BoxContainer(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: BoxContainer(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.help_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: CaptureButton(
                    onPressed: () { _captureImage(); } 
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}