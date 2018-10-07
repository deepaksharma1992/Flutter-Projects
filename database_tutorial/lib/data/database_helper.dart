import 'dart:async';
import 'dart:io';

import 'package:database_tutorial/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper().internal();
  static Database _db;
  final String userTable = "user";
  final String columnId = "_id";
  final String columnUserName = "user_name";
  final String columnPassword = "password";

  factory DatabaseHelper() => _instance;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initializeDb();
    return _db;
  }

  initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path + "mainDb.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $userTable($columnId, INTEGER PRIMARY KEY AUTOINCREMENT, $columnUserName TEXT, $columnPassword TEXT");
  }

  DatabaseHelper internal() {}

  Future<int> saveUser(User user) async {
    var ourDb = await db;
    int result = await ourDb.insert(userTable, user.toMap());
    return result;
  }

  Future<List> getAllUsers() async {
    var database = await db;
    var result = await database.rawQuery("SELECT * FROM $userTable");

    return result.toList();
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var result =
        dbClient.rawQuery("SELECT * FROM $userTable WHERE $columnId=$id");

    return result as User;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .delete(userTable, where: "$columnId =?", whereArgs: [id]);
    return result;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;

    return dbClient.update(userTable, user.toMap(),
        where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
