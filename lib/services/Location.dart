/*
* Location Class
* A Location objects represent a Position in Coordinates
* and store it
* */

import 'package:geolocator/geolocator.dart' as geolocator;

class Location {

  double latitude;
  double longitude;


  //obtener la posicion actual del usuario
  Future<void> getCurrentLocation() async{

    try {
      geolocator.Position position = await geolocator.getCurrentPosition(desiredAccuracy: geolocator.LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      latitude = 0.0;
      longitude = 0.0;
    }


  }


  //lanza una excepcion si el arg es >= 10
  void _dummyError(int dummyNumber){
    if (dummyNumber >= 10)
      throw FormatException("MAL HECHO");
  }

}