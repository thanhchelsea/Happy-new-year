import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String DB_NAME = "countdown_database.sqlite";
const String DB_NAME_CP = "countdown_database_cp.sqlite";
const String TABLE_LOICHUC = 'CAUCHUC';
const String TABLE_CAMNAMG = 'CAMNANG';
const String TABLE_SMS = 'SMSTEEN';
const String TABLE_VANKHAN = 'VANKHANTET';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider._();
  Database _database;

  DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME_CP);

    var exists = await databaseExists(path);

    if (!exists) {
      print('Creating new copy from assets');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", DB_NAME));
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
    return deleteDatabase(join(await getDatabasesPath(), DB_NAME_CP));
  }

  Future<List<LoiChucModel>> getLoiChucs(int groupId) async {
    final db = await database;
    List<Map<String, dynamic>> maps =
        await db.query(TABLE_LOICHUC, where: 'Nhom = ?', whereArgs: [groupId]);
    return maps.map((e) => LoiChucModel.fromJson(e)).toList();
  }

  Future<List<CamNangModel>> getCamNang(int groupId) async {
    final db = await database;
    List<Map<String, dynamic>> maps =
        await db.query(TABLE_CAMNAMG, where: 'Nhom = ?', whereArgs: [groupId]);
    return maps.map((e) => CamNangModel.fromJson(e)).toList();
  }

  Future<List<SMSTeenModel>> getSMS() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(TABLE_SMS);
    return maps.map((e) => SMSTeenModel.fromJson(e)).toList();
  }

  Future<List<VanKhanModel>> getVanKhan(int groupId) async {
    final db = await database;
    List<Map<String, dynamic>> maps =
    await db.query(TABLE_VANKHAN, where: 'Nhom = ?', whereArgs: [groupId]);
    return maps.map((e) => VanKhanModel.fromJson(e)).toList();
  }
}
