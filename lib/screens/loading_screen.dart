import 'package:flutter/material.dart';
import 'package:geoclima/services/Location.dart';
import 'package:geoclima/services/networking.dart';
import 'package:geoclima/utilities/constants.dart';


class LoadingScreen extends StatefulWidget {
  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  /*
  * Obtener latitud y longitud del dispositivo y los datos del tiempo
  * usando getCurrentLocation de la clase Latitude de geolocator package
  * */
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper network = NetworkHelper(
      apiUrl:
          'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&mode=json&appid=$kapiKey',
    );

    var weatherData = await network.getData();



  }

  /*
  * initState se llama únicamente al crear este widget.
  * Al iniciar el widget , obtenemos posición del dispositivo
  * */
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
