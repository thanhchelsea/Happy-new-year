import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String DB_NAME = "happy_new_year.db";
const String DB_NAME_CP = "happy_new_year_cp.db";
const String TABLE_LOICHUC = 'LOICHUC';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider._();
  Database _database;

  DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME_CP);

    var exists = await databaseExists(path);

    if (!exists) {
      print ('Creating new copy from assets');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "happy_new_year.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print('Opening existing database');
    }

    return await openDatabase(path);
  }

  Future close() async {
    return _database?.close();
  }

  Future deleteDB() async {
    return deleteDatabase(join(await getDatabasesPath(),DB_NAME_CP));
  }

  Future<List<LoiChuc>> getLoiChucs(String topic) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(TABLE_LOICHUC, where: 'ROLE = ?', whereArgs: [topic]);
    print(maps);
    return maps.map((e) => LoiChuc.fromJson(e)).toList();
  }
}