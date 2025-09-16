import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDb
{
  //database details
  static final _dbname = "note.db";
  static final _dbversion = 1;

  //category table details
  static final _tablename = "AddNote";
  static final _idcol = "id";
  static final title = "category_name";
  static final description = 'description';


  //private constructor
  MyDb._privateconstructor();

  //database object
  Database? db;

  //initialization
  static final MyDb instance = MyDb._privateconstructor();

  //get database details
  Future<Database> get database async => db ??= await _initDatabase();

  _initDatabase()async
  {
    Directory directorypath = await getApplicationDocumentsDirectory();
    print(directorypath);

    String finalpath = join(directorypath.path,_dbname);
    print(finalpath);

    return await openDatabase(finalpath,version: _dbversion,onCreate: _oncreate);

  }

  Future<void> _oncreate(Database db,int version)async
  {
    await db.execute
      ('''
          CREATE TABLE $_tablename 
          (
            $_idcol INTEGER PRIMARY KEY,
            $title TEXT NOT NULL,
            $description TEXT Not NULL
          )
        ''');

  }

  //insert category data
  Future<int> insertdata(Map<String, dynamic> row)async
  {
    Database? db = await instance.database;
    return await db.insert(_tablename,row);
  }


  //view
  Future<List<Map<String, dynamic>>> queryAllRows() async
  {
    Database db = await instance.database;
    return await db.query(_tablename);//select * from AddNote
  }

  //delete
  Future<int> deleteNote(int id) async
  {
    Database db = await instance.database;
    return await db.delete(_tablename, where: '$_idcol = ?', whereArgs: [id]);
  }

}