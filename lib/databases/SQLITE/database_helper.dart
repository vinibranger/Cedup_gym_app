import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'tcc.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
        await createTablesAvFisica(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      """CREATE TABLE exercicio(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome_exe TEXT,
        descris TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )    
      """,
    );
  }

  static Future<void> createTablesAvFisica(sql.Database database) async {
    await database.execute(
      """CREATE TABLE avfisica(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        braco TEXT,
        tronco TEXT,
        perna TEXT,
        peso TEXT,
        altura TEXT,
        data TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )    
      """,
    );
  }

  static Future<int> createItem(String? nomeExe, String? descris) async {
    final db = await DatabaseHelper.db();

    final data = {'nome_exe': nomeExe, 'descris': descris};
    final id = await db.insert('exercicio', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }


  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('exercicio', orderBy: "id");
  }


  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('exercicio', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String nomeExe, String? descris) async {
    final db = await DatabaseHelper.db();

    final data = {
      'nome_exe': nomeExe,
      'descris': descris,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('exercicio', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("exercicio", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("ERRO PARA DELETAR: $err");
    }
  }

  static Future<int> insertAddAvfisi(String? braco, String? tronco) async {
    final db = await DatabaseHelper.db();

    final data = {'braco': braco, 'tronco': tronco};
    final id = await db.insert('avfisica', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getAvalias() async {
    final db = await DatabaseHelper.db();
    return db.query('avfisica', orderBy: "id");
  }


  static Future<List<Map<String, dynamic>>> getAvalia(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('avfisica', where: "id = ?", whereArgs: [id], limit: 1);
  }
}
