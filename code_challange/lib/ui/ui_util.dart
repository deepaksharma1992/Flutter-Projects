import 'package:flutter/material.dart';

// class to return the reusing widget code
class UiUtil {
  // method will return the image code of change fly logo and code
  static Widget getChangeFlyImage() {
    return Container(
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Importing the asset from images asset folder from pubspec.yaml file
          new Image.asset(
            "images/changefly_cube.png",
            width: 120.0,
            height: 120.0,
          ),
          new Image.asset(
            "images/changefly_name.png",
            width: 250.0,
            height: 80.0,
          )
        ],
      ),
    );
  }

  // method will return the app bar widget
  static Widget getAppBar(String appBarTitle) {
    return AppBar(
      title: new Text(
        appBarTitle,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
