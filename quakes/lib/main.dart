import 'package:flutter/material.dart';
import 'package:quakes/model/Properties.dart';
import 'package:quakes/ui/quake.dart';

void main() async {
  List<Properties> propertyList = await new LoadQuakeData().setQuakeData();
  runApp(new MaterialApp(
    home: new Quake(propertyList),
  ));
}
