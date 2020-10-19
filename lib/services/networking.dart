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

  Future getData() async{
    String data; //donde se va a almacenar el json
    http.Response response = await http.get(apiUrl); //obtenemos los datos
    // 200 = OK (se ha atendido a la peticion con exito y tenemos el json)
    if(response.statusCode == 200){
      data = response.body; //guardamos el json en el string data

      return jsonDecode(data);

    }else{
      print('ERROR: ${response.statusCode}');
    }
  }

}
