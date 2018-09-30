import 'package:flutter/material.dart';

class WeightCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WeightOnPlanetX();
  }
}

class WeightOnPlanetX extends State<WeightCalculator> {
  /*
   * pluto 0.06
   * mars  0.38
   * venus 0.91
   */

  BuildContext mContext;
  final _userController = new TextEditingController();
  double _weight;
  int _radioValue = 0;
  double _finalWeight = 0.0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _calculateWeightOnPlanet(_userController.text, 0.06);
          break;
        case 1:
          _calculateWeightOnPlanet(_userController.text, 0.38);
          break;
        case 2:
          _calculateWeightOnPlanet(_userController.text, 0.91);
          break;
      }
    });
  }

  void _calculateWeightOnPlanet(String weightText, double planetMultiplier) {
    if (weightText.isNotEmpty) {
      _finalWeight = double.parse(weightText) * planetMultiplier;
    } else {
      _finalWeight = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: new Text('Weight on Planet X'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/planet.png',
            width: 380.0,
            height: 180.0,
          ),
          new TextField(
            controller: _userController,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: "Your weight on earth",
                hintText: "In Pounds",
                fillColor: Colors.white,
                icon: new Icon(Icons.person),
                hintStyle: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChanged),
                new Text(
                  "Pluto",
                  style: TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChanged),
                new Text(
                  "Mars",
                  style: TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChanged),
                new Text(
                  "Venus",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Center(
            child: new Text(
              _finalWeight > 0
                  ? "Your weight on this planet is ${_finalWeight.toStringAsFixed(2)}lbs"
                  : "Please enter your weight",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey.shade200,
    );
  }
}
