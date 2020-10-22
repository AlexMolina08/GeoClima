import 'package:flutter/material.dart';
import 'package:geoclima/utilities/constants.dart';
import 'package:translator/translator.dart'; //para traducir el nombre de la ciudad al inglés

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _cityName; //nobre de la ciudad introducida por el usuario
  final translator = GoogleTranslator();

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
                  flex: 2,
                  child: TextField(
                      onChanged: (value) {
                        _cityName = value;
                      },
                      decoration: kTextFieldInputDecoration,
                      style: kInputTextStyle),
                ),
                //textField
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xff455a64),
                      onPressed: () async {
                        //traducimos el nombre introducido por el usuario
                        Translation translation = await translator
                            .translate(_cityName, from: 'es', to: 'en');
                        _cityName = translation.text;
                        //lo mandamos a la pagina anterior
                        Navigator.pop(context,
                            _cityName); //Hacemos pop y enviamos el nombre de la ciudad
                        //introducida por el user a la pantalla anterior
                      },
                      child: Text(
                        "Consultar tiempo",
                        style: kInformationTitleTextStyle,
                      ),
                    ),
                  ),
                ),
                //mensaje informativo de la pagina
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      "Conoce el tiempo actual de cualquier parte del mundo",
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
