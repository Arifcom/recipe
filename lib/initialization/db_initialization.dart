import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBInitialization {
  static final DBInitialization _instance = DBInitialization.internal();
  DBInitialization.internal();

  factory DBInitialization() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "recipe");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE favorite(id INTEGER PRIMARY KEY, idMeal TEXT, strMeal TEXT, strMealThumb TEXT, createDate TEXT, updateDate TEXT)");
    print("DB Created");
  }
}