/*
* Location Class
* A Location objects represent a Position in Coordinates
* and store it
* */

import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;


  //obtener la posicion actual del usuario
  void getCurrentLocation() async{
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      latitude = 8.0;
      longitude = 8.0;
    }


  }

}