import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao/dao.dart';

class DatabaseHelper {
  static final _dbName = 'tanipedia_database.db';
  static final _dbVersion = 1;
  DatabaseHelper._createInstance();
  static DatabaseHelper instance = DatabaseHelper._createInstance();
  static Database _database;

  Future<Database> get database async{
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE ${ProfileDao.tableProfile} (
        ${ProfileDao.columnIdProfile} INTEGER PRIMARY KEY,
        ${ProfileDao.columnIdProfileAPI} INT,
        ${ProfileDao.columnName} TEXT
        )
        '''
    );
  }
}

/*
* To Use Database = await DatabaseHelper.instance.method
* */