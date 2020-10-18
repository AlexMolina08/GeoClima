import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {

  //get the location of the current user
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String current_position;

  void getLocation() async{
    //obtenemos posicion de getCurrentPosition
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    current_position = '$position';
    print(current_position);
  }

  /*
  * initState se llama únicamente al crear el widget en el widget tree
  * */
  @override
  void initState(){
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Las coordenadas de tu posición son : ',
              style: kMessageTextStyle,
            ),
            Text(
              'pos : $current_position', //mostramos la ubicación
              style: kMessageTextStyle,
            ),
          ],
        )
      ),
    );
  }
}
