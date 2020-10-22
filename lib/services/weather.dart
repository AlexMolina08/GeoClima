import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geoclima/services/Location.dart';
import 'package:geoclima/services/networking.dart';


/*
* WeatherModel es la encargada de obtener lo referido al tiempo dentro de geoclima

    * Devuelve el tiempo en la ubicacion del dispositivo
    * Devuelve la imagen de fondo mostrada
    * Devuelve el icono de clima
* **/
class WeatherModel {
  /*
  *
  * Obtiene el tiempo de la ciudad pasada por parametros
  * Devuelve los datos del tiempo en esa ubicacion
  *
  * */
  Future<dynamic> getCityWeather(String cityName) async{

    var url = '$kWeatherUrl?q=$cityName&appid=$kapiKey&units=metric';

    NetworkHelper network = NetworkHelper(apiUrl: url);

    var weatherData = await network.getData();

    return weatherData;

  }

  /*
  *
  * Obtiene el tiempo de la ubicacion actual  del dispositivo
  * Devuelve los datos del tiempo en esa ubicacion
  *
  * */
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper network = NetworkHelper(
        apiUrl: '$kWeatherUrl?lat=${location.latitude}'
            '&lon=${location.longitude}&mode=json&appid=$kapiKey&units=metric',
      );

    //llamamos a getData de network para obtener los datos
    var weatherData = await network.getData();

    return weatherData;

  }

  AssetImage getWeatherImage(int condition) {
    if (condition < 299)
      return AssetImage('images/weather/tormenta_200.png');
    else if (condition < 399)
      return AssetImage('images/weather/llovizna_300.png');
    else if (condition < 599)
      return AssetImage('images/weather/lluvia_500.png');
    else if (condition < 699)
      return AssetImage('images/weather/nieve_600.png');
    else if (condition < 799)
      return AssetImage('images/weather/niebla_700.png');
    else if (condition == 800)
      return AssetImage('images/weather/sol_800.png');
    else if (condition > 800)
      return AssetImage('images/weather/nublado800.png');
    else
      return AssetImage('images/weather/error.png');
  }

  AssetImage getBackgroundImage(int condition) {
    if (condition < 299)
      return AssetImage('images/backgrounds/storm.png');
    else if (condition < 399)
      return AssetImage('images/backgrounds/drizzle.jpg');
    else if (condition < 599)
      return AssetImage('images/backgrounds/rain.jpg');
    else if (condition < 699)
      return AssetImage('images/backgrounds/snow.jpg');
    else if (condition < 799)
      return AssetImage('images/backgrounds/fog.jpeg');
    else if (condition == 800)
      return AssetImage('images/backgrounds/clear.jpg');
    else if (condition > 800)
      return AssetImage('images/backgrounds/cloudy.jpeg');
    else
      return AssetImage('images/backgrounds/clear.jpg');
  }

  String getMessage(int temp, String cityName) {

    if(temp == null) return "No se ha podido acceder a tu ubicación 😭";

    if (temp >= 35)
      return "¡ Menudo calor hace en $cityName 🥵 ! Mas te vale buscar una piscina 🏊🏊‍";
    else if (temp >= 30)
      return '¡ Se está poniendo la cosa ardiendo $cityName ! No te lleves sudadera 🧥  🥵  ';
    else if (temp >= 25)
      return '¡Hoy se está en la gloria en $cityName!Yo que tú aprovechaba 😉 🍻 ';
    else if (temp > 20)
      return '¡ Un buen día para llevar 👕 en $cityName !';
    else if (temp > 10)
      return 'Llévate algo de abrigo hoy, puede que refresque en $cityName ☃️';
    else
      return 'Hoy hace frío en $cityName 🥶, ¡ Haz que tu abuela esté orgullosa y coge abrigo ! 🤶🏻  🧥';
    ;
  }
}
