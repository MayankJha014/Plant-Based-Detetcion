import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //CREATING Database Table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE searchList(
      "index" INTEGER
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('anime_spy.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(int index) async {
    final db = await SQLHelper.db();
    final data = {
      'index': index,
    };
    final uid = await db.insert(
      'searchList',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return uid;
  }

  static Future<List<int>> getItems() async {
    final db = await SQLHelper.db();
    List<Map<String, dynamic>> rows =
        await db.query('searchList', orderBy: '"index"');

    // Extract the 'index' values and return them as a List<int>
    List<int> indexes = [];
    for (var row in rows) {
      indexes.add(row['index'] as int);
    }

    return indexes;
  }

  // static Future<List<Map<String, dynamic>>> getItems() async {
  //   final db = await SQLHelper.db();
  //   return db.query('searchList', orderBy: 'index');
  // }
}
