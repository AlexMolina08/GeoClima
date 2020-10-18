import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geoclima/services/Location.dart';


class LoadingScreen extends StatefulWidget {

  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print("Latitud: ${location.latitude} , Longitud ${location.longitude}");
  }

  /*
  * initState se llama únicamente al crear este widget.
  * Al iniciar el widget , obtenemos posición del dispositivo
  * */
  @override
  void initState(){
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

    );
  }
}
