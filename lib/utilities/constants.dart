import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String kapiKey = '900b943bb1d48f5e785c8a1dc5a0be91';
const String kWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

const kIconSize = 40.0;

/* ICONOS */

const Icon kTextFieldIcon = Icon(
  Icons.location_city,
  size: 30.0,
);

/*  COLORES ESPECÍFICOS */
const Color kTextFieldColor = Color(0xd9ffffff);

/*  TEXT STYLES  */

const TextStyle kInputTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 15.0);

const TextStyle kInformationTitleTextStyle = TextStyle(
    fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 30.0);

const TextStyle kTemperatureTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 100.0,
    color: Colors.white);

const TextStyle kMessageTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 40.0,
    color: Colors.white);

const TextStyle kInformationTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w100,
    fontSize: 20.0,
    color: Color(0xccfafafa));

const TextStyle kLoadingTextStyle =
    TextStyle(fontFamily: "Poppins", fontSize: 20.0, color: Colors.blueGrey);

const TextStyle kConditionTextStyle = TextStyle(fontSize: 70.0);

//-----------------------

const InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: kTextFieldColor,
  icon: kTextFieldIcon,
  hintText: "Introduce el nombre de una ciudad",
  hintStyle: TextStyle(
    color: Color(0xff9e9e9e),
  ),
  //cambiamos los border a redondeados
  border: OutlineInputBorder(
    borderSide: BorderSide.none, //quitar seleccion exterior
    borderRadius: BorderRadius.all(
      Radius.circular(18.0),
    ),
  ),
);
//--------------

//LOADING INDICATOR
const SpinKitSpinningCircle kSpinkit = SpinKitSpinningCircle(
  color: Colors.blueAccent,
  size: 90.0,
);

//
