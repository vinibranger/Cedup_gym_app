
// ignore_for_file: file_names

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Construtor com acesso privado
  DB._();
  // Criar uma instancia de DB
  static final DB instance = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'persoufit.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(avaliacaofisica);
  }

  String get avaliacaofisica => '''
    CREATE TABLE avfisica (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      braco TEXT,
      tronco TEXT,
      imc TEXT,
      perna TEXT,
      peso TEXT,
      altura TEXT,
      data TEXT

    );
  ''';


}
