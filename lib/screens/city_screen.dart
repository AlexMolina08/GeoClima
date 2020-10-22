import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backgrounds/city_background.jpg"),
              fit: BoxFit.cover),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                //Boton para ir a página anterior
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    minWidth: kIconSize,
                    padding: EdgeInsets.only(top: 10.0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: kIconSize,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                //TEXTFIELD CIUDAD
                Expanded(
                  flex: 2 ,
                  child: TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    decoration: kTextFieldInputDecoration,
                    style: kInputTextStyle
                  ),
                ),
                //textField
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Ver el tiempo",
                        style: kInformationTitleTextStyle,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      "Conoce el tiempo actual de cualquier ciudad del mundo",
                      style: kInformationTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
