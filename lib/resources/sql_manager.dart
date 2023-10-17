import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starters_bloc/models/food.dart';

class SqlManager {
  SqlManager._();
  static final SqlManager _instance = SqlManager._();
  static Database? _database;

  factory SqlManager() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'foods_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE foods(id INTEGER PRIMARY KEY, name TEXT, imageURL TEXT, protein INTEGER, carbs INTEGER, price REAL, description TEXT, calories INTEGER)',
        );
      },
      version: 1,
    );

    return database;
  }

  void insertFoodToDB(Food food) async {
    await _database!.insert(
      'foods',
      food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Food>> getAllFoodListFromDB() async {
    final List<Map<String, dynamic>> maps = await _database!.query('foods');
    return List.generate(maps.length, (i) {
      return Food(
        id: maps[i]['id'],
        name: maps[i]['name'],
        imageURL: maps[i]['imageURL'],
        protein: maps[i]['protein'],
        carbs: maps[i]['carbs'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        calories: maps[i]['calories'],
      );
    });
  }

  Future<void> deleteFoodFromDB(int id) async {
    await _database!.delete(
      'foods',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
