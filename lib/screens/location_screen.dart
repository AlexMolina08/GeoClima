import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';

class LocationScreen extends StatelessWidget {
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

              Padding(
                padding: EdgeInsets.only(left:15.0),
                child: Row(
                  children: [
                    Text(
                      "9º",
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
                "Hoy hace frío en Granada 🥶 , ¡ Haz que tu abuela esté orgullosa y coge abrigo ! 🧥",
                style: kMessageTextStyle,
              )

            ],
          ),
        ),
      ),
    );
  }
}
