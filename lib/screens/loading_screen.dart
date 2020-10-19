import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geoclima/screens/location_screen.dart';
import 'package:geoclima/services/Location.dart';
import 'package:geoclima/services/networking.dart';
import 'package:geoclima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool apiRequestFinished = false;

  /*
  * Obtener latitud y longitud del dispositivo y los datos del tiempo
  * usando getCurrentLocation de la clase Latitude de geolocator package
  * */
  void getLocationData() async {
    Location location = Location();

    //ESPERAMOS A TENER LA UBICACIÓN
    await location.getCurrentLocation();

    NetworkHelper network = NetworkHelper(
      apiUrl:
      'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&mode=json&appid=$kapiKey&units=metric',
    );

    // ESPERAMOS A OBTENER LOS DATOS
    //lo que nos devuelve getData es una tabla hash (hashMap <String, dynamic>
    var weatherData = await network.getData();
    setState(() {
      apiRequestFinished = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
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
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Obteniendo datos de tu ubicación ... ",
                  style: kLoadingTextStyle),
              SizedBox(height: 40.0),
              kSpinkit
            ],
          ),
        ),
      ),
    );
  }
}
