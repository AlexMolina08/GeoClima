import 'package:flutter/material.dart';
import 'package:geoclima/screens/location_screen.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geoclima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /*
  * Obtener latitud y longitud del dispositivo y los datos del tiempo
  * usando getCurrentLocation de la clase Latitude de geolocator package
  * */
  void getLocationData() async {
    dynamic weatherData = await WeatherModel()
        .getLocationWeather(); //obtenemos los datos del tiempo
    //una vez obteniodos los datos , saltamos a LocatioScreen con los datos del tiempo

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData,);
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
