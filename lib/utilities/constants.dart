import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


String kapiKey = '900b943bb1d48f5e785c8a1dc5a0be91';



/*  TEXT STYLES  */
const TextStyle kButtonTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontWeight: FontWeight.w600,
  fontSize: 20.0
);

const TextStyle kTemperatureTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 100.0,
    color: Colors.white
);

const TextStyle kMessageTextStyle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 40.0,
    color: Colors.white
);

const TextStyle kLoadingTextStyle = TextStyle(
    fontFamily: "Poppins",
    //fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.blueGrey
);

const TextStyle kConditionTextStyle = TextStyle(
  fontSize: 70.0
);

//LOADING INDICATOR
const SpinKitSpinningCircle kSpinkit = SpinKitSpinningCircle(
color: Colors.blueAccent,
size: 90.0,
);