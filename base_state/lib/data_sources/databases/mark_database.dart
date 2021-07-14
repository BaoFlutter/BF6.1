import 'dart:io';

import 'package:base_state/data_sources/databases/mark_model.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class MarkDatabase{

  final String DB_NAME = "mark_db.db";
  final String TABLE = "mark_store" ;
  final String ID = "mark_id";
  final String MARK_AVERAGE = "mark_average";
  final String GRADE ="grade";

  static final MarkDatabase _instance = MarkDatabase._();
  static Database? _database;

  MarkDatabase._();

  factory MarkDatabase() {
    return _instance;
  }

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }
/*
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/dicts", DB_NAME));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // open the database
    var db = await openDatabase(path, readOnly: true);
    return db;
  }
  
 */
  
   // Dùng cho tự tạo database , không có database sẵn trong assets
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    var database = openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }
   

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $MARK_AVERAGE TEXT,
        $GRADE TEXT)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addWord(MarkModel mark) async {
    var client = await db;
    return client!.insert(TABLE, mark.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<MarkModel?> fetchWord(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return MarkModel.fromJson(maps.first);
    }
    return null;
  }

  

  Future<List<MarkModel>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);

    if (res.isNotEmpty) {
      var marks = res.map((wordMap) => MarkModel.fromJson(wordMap)).toList();
      return marks;
    }
    return [];
  }

  Future<int> updateMark(MarkModel mark) async {
    var client = await db;
    return client!.update(TABLE, mark.toJson(),
        where: '$ID = ?', whereArgs: [mark.mark_id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> removeMark(int id) async {
    var client = await db;
    return client!.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }


}