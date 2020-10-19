import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //para usar lo que hay en el paquete con hhtp
import 'package:geoclima/utilities/constants.dart';
import 'dart:convert';

/*
* CLASE NetworkHelper ,
*
* conecta con la API de openweather para obtener información climática
*
*
* */

class NetworkHelper{
  final String apiUrl;

  NetworkHelper({@required this.apiUrl});

  void getData() async{
    String data; //donde se va a almacenar el json
    var decodedData; //donde se almacena el json descodificado para acceder a las variables

    http.Response response = await http.get(apiUrl); //obtenemos los datos

    // 200 = OK (se ha atendido a la peticion con exito y tenemos el json)
    if(response.statusCode == 200){
      data = response.body; //guardamos el json en el string data
      decodedData = jsonDecode(data);

      print('Nombre de la ciudad : ${decodedData['name']}');
      print('Temperatura : ${decodedData['main']['temp']}');

    }else{
      print('ERROR: ${response.statusCode}');
    }
  }

}
