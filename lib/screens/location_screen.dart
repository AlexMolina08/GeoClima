import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;

  LocationScreen({@required this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature;
  int conditionCode;
  String cityName;

  void updateUI(dynamic weatherData){
    temperature = (weatherData['main']['temp']).toInt(); //obtenemos la temperatura de weatherData y la
                                                         //convertimos en un entero
    conditionCode = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
  }


  @override
  void initState() {
    print(widget.locationWeather);
    //al crear la pagina , se inicializan las propiedades
    updateUI(widget.locationWeather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/location_background.jpg"),
              fit: BoxFit.cover
              ),
        ),
        //constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //My Location and City buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    shape: CircleBorder(), //flatbutton con circle shape
                    onPressed: (){},
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0 , 0.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    shape: CircleBorder(), //flatbutton con circle shape
                    onPressed: (){},
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0 , 0.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),

              //TEMPERATURA
              Padding(
                padding: EdgeInsets.only(left:15.0),
                child: Row(
                  children: [
                    Text(
                      '${temperature.round()}º ',
                      style: kTemperatureTextStyle,
                    ),
                    Text(
                      "❄",
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),

              Text(
                "Hoy hace frío en $cityName 🥶, ¡ Haz que tu abuela esté orgullosa y coge abrigo ! 🧥",
                style: kMessageTextStyle,
                textAlign: TextAlign.right,
              )

            ],
          ),
        ),
      ),
    );
  }
}
