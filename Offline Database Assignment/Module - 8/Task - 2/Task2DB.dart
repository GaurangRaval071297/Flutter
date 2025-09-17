import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDb {
  // Database details
  static final _dbname = "todo.db";
  static final _dbversion = 1;

  // Table details
  static final _tablename = "AddToDo";
  static final _idcol = "id";
  static final title = "todoTitle";
  static final isDone = "isDone";

  // Private constructor
  MyDb._privateconstructor();

  // Database object
  Database? db;

  // Initialization
  static final MyDb instance = MyDb._privateconstructor();

  // Get database details
  Future<Database> get database async => db ??= await _initDatabase();

  // Initialize database
  _initDatabase() async {
    Directory directorypath = await getApplicationDocumentsDirectory();
    String finalpath = join(directorypath.path, _dbname);

    return await openDatabase(finalpath,
        version: _dbversion, onCreate: _onCreate);
  }

  // Create table (with isDone column)
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tablename (
        $_idcol INTEGER PRIMARY KEY,
        $title TEXT NOT NULL,
        $isDone INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // Insert data
  Future<int> insertdata(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(_tablename, row);
  }

  // Query all data
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_tablename); // SELECT * FROM AddToDo
  }

  // Delete data
  Future<int> deleteNote(int id) async {
    Database db = await instance.database;
    return await db.delete(_tablename, where: '$_idcol = ?', whereArgs: [id]);
  }

  // Update task completion status (toggle isDone)
  Future<int> updateTaskStatus(int id, bool isDone) async {
    Database db = await instance.database;
    return await db.update(
      _tablename,
      {MyDb.isDone: isDone ? 1 : 0}, // Set isDone to 1 (completed) or 0 (not completed)
      where: '$_idcol = ?',
      whereArgs: [id],
    );
  }
}