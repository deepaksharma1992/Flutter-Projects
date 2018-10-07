import 'package:database_tutorial/data/database_helper.dart';
import 'package:database_tutorial/model/user.dart';
import 'package:database_tutorial/ui/home_class.dart';
import 'package:flutter/material.dart';

void main() async {
  var db = new DatabaseHelper();
  await db.saveUser(new User("deepak", "sharma"));
  await db.saveUser(new User("deepesh", "katiyar"));
  await db.saveUser(new User("nikhil", "upadhyay"));

  List<User> getAllUsers = await db.getAllUsers();

  print(getAllUsers[0].userName);

  runApp(new MaterialApp(
    home: new Home(),
  ));
}
