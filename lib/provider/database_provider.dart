import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBServiceProvider extends ChangeNotifier {
  static Database? db;

  List<Map<String, dynamic>> taskdata = [];

  Future<void> openMyDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE Todo(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, detail TEXT,time TEXT)''',
        );
      },
    );
  }

  void addData(Map<String, Object?> task) async {
    try {
      int a = await db!
          .insert('Todo', task, conflictAlgorithm: ConflictAlgorithm.replace);
      print(a);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void getData() async {
    final data = await db!.query('Todo');

    taskdata.addAll(data);
    print(taskdata);
    notifyListeners();
  }

  void removeData(int id) async {
    await db!.delete(
      'Todo',
      // Use a `where` clause to delete a specific dog.
      where: 'id=?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );

    print(taskdata);

    taskdata.removeWhere(
      (element) {
        return element['id'] == id;
      },
    );

    notifyListeners();
  }
}
