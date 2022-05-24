import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as pt;

class HelperDb {
  static Future<sql.Database> database(String tableName) async {
    final databasePath = await sql.getDatabasesPath();
    final path = pt.join(databasePath, 'database2.db');
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE $tableName (id VARCHAR PRIMARY KEY,title TEXT,image TEXT)');
      },
    );
  }

  static Future<void> insertData(
      String tableName, Map<String, dynamic> data) async {
    final dataBase = await database(tableName);

    dataBase.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> fetchData(String tableName) async {
    print("inside fetch");
    final dataBase = await database(tableName);
    return dataBase.query(tableName);
  }
}
