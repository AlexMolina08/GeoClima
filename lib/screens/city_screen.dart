import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/city_background.jpg"),
              fit: BoxFit.cover
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              //Boton para ir a página anterior
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              //textField
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),

              FlatButton(
                onPressed: () {},
                child: Text(
                  "Dime el tiempo",
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
