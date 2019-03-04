import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbProvider {
  const DbProvider();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "FilmDb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Roll ('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'date TEXT,'
          'time TEXT,'
          'camera TEXT,'
          'iso INTEGER,'
          'push INTEGER'
          ')');
    });
  }
}
