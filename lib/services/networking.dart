/*
* CLASE NetworkHelper ,
*
* conecta con la API de openweather para obtener información climática
*
*
* */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //para usar lo que hay en el paquete con hhtp
import 'dart:convert';


class NetworkHelper{
  final String apiUrl;

  NetworkHelper({@required this.apiUrl});

  /*
  * Obtener datos del clima de openWeather a partir de apiUrl
  * */
  Future getData() async{
    http.Response response = await http.get(apiUrl); //obtenemos los datos
    // 200 = OK (se ha atendido a la peticion con exito y tenemos el json)
    if(response.statusCode == 200){
      String data = response.body; //guardamos el json en el string data
      return jsonDecode(data); //devuelve hashMap<String,dynamic>
    }else{
      print('ERROR: ${response.statusCode}');
    }
  }

}
