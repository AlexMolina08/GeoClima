import 'package:flutter/material.dart';
import 'package:geoclima/screens/loading_screen.dart';
import 'package:geoclima/screens/location_screen.dart';

void main() {
  runApp(GeoClima());
}

class GeoClima extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: LoadingScreen()
    );
  }
}
