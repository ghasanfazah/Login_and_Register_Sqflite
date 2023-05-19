import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class db{

  static Database? _database;
  static const table = 'user';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnFamily = 'family';
  static const columnPassword = 'password';




  // getter for db
  Future<Database?> get mydb async{

    if (_database == null){
      _database = await _intialDb();

      return _database;
    }else {
      return _database;
    }
  }


  _intialDb() async{
    String databasepath = await getDatabasesPath();
    String path =join(databasepath,'User.db');
    Database mydb =await openDatabase(path , onCreate: _onCreate) ;
    return mydb;
  }

  _onCreate(Database db ,int version) async{
    await db.execute('''
        CREATE TABLE $table (
        
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT ,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER  NOT NULL,
            $columnFamily TEXT  NOT NULL,
            $columnPassword INTEGER NOT NULL
          )
          ''');

  }


  // SELECT
  readData(String sql) async{

    Database? mydb =await _database;
    List<Map> response =await mydb!.rawQuery(sql);
    return response;
  }


  // INSERT
  insertData(String sql) async{
    Database? mydb =await _database;
    int response =await mydb!.rawInsert(sql);
    return response;
  }

  // UPDATE
  updateData(String sql) async{
    Database? mydb =await _database;
    int response =await mydb!.rawUpdate(sql);
    return response;
  }

  //DELETE
  MydeleteData() async{
    String mydb =await getDatabasesPath();
    // int response =await mydb!.rawDelete(sql);
    String path= join(mydb,'User.db');
    await deleteDatabase(path);
  }

}