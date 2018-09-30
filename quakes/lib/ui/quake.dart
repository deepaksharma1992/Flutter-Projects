import 'package:flutter/material.dart';
import 'package:quakes/model/Properties.dart';
import 'package:quakes/network/http_handler.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class LoadQuakeData {
  Map _quakeData;
  List featureList;
  List<Properties> propertyList = [];

  Future<List> setQuakeData() async {
    _quakeData = await new HttpHandler(
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
        .returnJSONResponse();

    featureList = _quakeData['features'];

    for (int i = 0; i < featureList.length; i++) {
      var magnitude = featureList[i]['properties']['mag'];
      String place = featureList[i]['properties']['place'];
      var timeStamp = featureList[i]['properties']['time'];

      DateTime date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
      var format = new DateFormat("MMMM dd, yyy h:mm a");
      var time = format.format(date);

      propertyList.add(new Properties(magnitude, place, time));
    }
    return propertyList;
  }
}

class Quake extends StatelessWidget {
  List<Properties> propertyList = [];

  Quake(this.propertyList);

  void _displayMessage(BuildContext context, String message) {
    var alertDialog = new AlertDialog(
      title: new Text('Quake'),
      content: Text(message),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(
            "Ok",
            style: TextStyle(color: Colors.pinkAccent),
          ),
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        )
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    print(propertyList.length);
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: new Text('Quakes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return Card(
              margin: EdgeInsets.all(4.0),
              elevation: 2.0,
              child: new ListTile(
                title: new Text(
                  "${propertyList[position].time}",
                  style: TextStyle(
                      color: Colors.amber.shade800,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: new Text(propertyList[position].place),
                leading: new CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.lightGreen,
                  child: new Text(
                    propertyList[position].magnitude.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () =>
                    _displayMessage(context, propertyList[position].place),
              ),
            );
//            );
          },
          itemCount: propertyList.length,
        ),
      ),
    );
  }
}
