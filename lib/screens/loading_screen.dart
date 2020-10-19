import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geoclima/services/Location.dart';
import 'package:http/http.dart' as http; //para usar todo lo que hay en el paquete con hhtp
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  /*
  * Obtener latitud y longitud del dispositivo
  * usando getCurrentLocation de la clase Latitude de geolocator package
  * */
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("Latitud: ${location.latitude} , Longitud ${location.longitude}");
  }

  /*
  * Obtener datos de openweather API
  *
  * */

  void getData() async {
    String data ;
    //El metodo devuelve un Future<Response>
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?lat=37.207207207207205&lon=-3.619648330507012&mode=json&appid=900b943bb1d48f5e785c8a1dc5a0be91',);

    if(response.statusCode == 200) {
      /*
      * El resultado del request es un json
      * es decir , los datos están en formato {"key" : value}
      * */
      data = response.body;
      print(data);

      var temp = jsonDecode(data) ['main']['temp']; // temperatura
      var condition_number = jsonDecode(data)['weather'][0]['id']; //condition_number
      var city_name = jsonDecode(data)['name']; //city name

      print('temperatura: $temp\ncondition number: $condition_number\nnombre ciudad: $city_name');
      print('temperatura: $temp\ncondition number: $condition_number\nnombre ciudad: $city_name');

    }else {
      print(response.statusCode);
    }

  }

  /*
  * initState se llama únicamente al crear este widget.
  * Al iniciar el widget , obtenemos posición del dispositivo
  * */
  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
