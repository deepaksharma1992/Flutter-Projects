import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  /*
   * Below 18.5	Underweight
      18.5 – 24.9	Normal
      25.0 – 29.9	Overweight
      30.0 and Above	Obese
   */

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMICalculator();
  }
}

class BMICalculator extends State<Bmi> {
  final _ageController = new TextEditingController();
  final _heightController = new TextEditingController();
  final _weightController = new TextEditingController();
  double _finalBMI = 0.0;
  String _BMIStatus = "";


  void _calculateBME() {
    setState(() {
      if (_ageController.text.isEmpty) {
        _BMIStatus = "Enter your age";
      } else if (_heightController.text.isEmpty) {
        _BMIStatus = "Enter your height";
      } else if (_weightController.text.isEmpty) {
        _BMIStatus = "Enter your weight";
      } else {
        double weight = double.parse(_weightController.text);
        double height = double.parse(_heightController.text);

        double multiple = height * height;
        print("multiple value $multiple");

        double fraction = weight/multiple;
        print("fraction value $fraction");
        double finalValue = fraction * 703;

        print("final value $finalValue");

//        _finalBMI = (weight / (height * height)) * 703;
        _finalBMI = (weight / (height * height));
        print("actual fraction value$_finalBMI");
        _finalBMI = _finalBMI * 703.0;
        print("actual final value $_finalBMI");

        if (_finalBMI < 18.5) {
          _BMIStatus = "Underweight";
        } else if (_finalBMI >= 18.5 && _finalBMI < 25.0) {
          _BMIStatus = "Normal";
        } else if (_finalBMI > -25.0 && _finalBMI < 30.0) {
          _BMIStatus = "Overweight";
        } else {
          _BMIStatus = "Obese";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI Calculator"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              width: 380.0,
              height: 100.0,
            ),
            new Container(
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(
                          Icons.person,
                        ),
                        hintText: "Age",
                        labelText: "Enter your age"),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(
                          Icons.accessibility,
                        ),
                        hintText: "Height",
                        labelText: "Enter height in feet"),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(
                          Icons.dehaze,
                        ),
                        hintText: "weight",
                        labelText: "Enter weight in pounds"),
                  ),
                  new RaisedButton(
                    onPressed: _calculateBME,
                    color: Colors.pinkAccent,
                    child: new Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: new Text(
                  "Your BMI: ${_finalBMI.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: new Text(
                  "$_BMIStatus",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 22.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
