import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoclima/screens/city_screen.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:geoclima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  AssetImage weatherImage;
  AssetImage backgroundImage;
  String message;
  String cityName;

  bool p = false;


  void updateUI(dynamic weatherData){

    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherImage = AssetImage('images/weather/error.png');
        message = weather.getMessage(null , null);
        backgroundImage = weather.getBackgroundImage(0);

      }
      temperature = (weatherData['main']['temp']).toInt(); //sólo nos interesa el valor entero de la temperatura
      cityName = weatherData['name'];
      int condition = weatherData['weather'][0]['id'];
      weatherImage = weather.getWeatherImage(condition);
      backgroundImage = weather.getBackgroundImage(condition);
      message = weather.getMessage(temperature, cityName);
    });
  }

  @override
  void initState() {
    //al crear la pagina , se inicializan las propiedades
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover
              ),
        ),
        //constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //My Location and Choose City buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //My Location button
                  FlatButton(
                    shape: CircleBorder(), //flatbutton con circle shape
                    onPressed: () async{
                      dynamic weatherData;
                       weatherData = await weather.getLocationWeather();
                       updateUI(weatherData);
                       print("actualizada");
                    },
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
                        size: kIconSize,
                      ),
                    ),
                  ),

                  //Choose city button
                  FlatButton(
                    shape: CircleBorder(), //flatbutton con circle shape
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return CityScreen();
                        },),
                      );
                    },
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
                        size: kIconSize,
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
                      '$temperature º',
                      style: kTemperatureTextStyle,
                    ),
                    Image(
                      image: weatherImage
                    )
                  ],
                ),
              ),

              Text(
                message,
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
