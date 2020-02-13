import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen/home_screen.dart' as home;
import 'services/animal_discovery.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bear Grylls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home.HomeScreen(),
    );
  }
}
