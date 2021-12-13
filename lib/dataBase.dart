import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection{
  String appUser="app_user1";
  String name="name";
  String mobile="mobile";




  Future<Database> createDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'mydatabase.db');
    return openDatabase(dbPath, version: 1, onCreate: populateDB);
  }

  Future<void> deleteDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'mydatabase.db');
    await deleteDatabase(dbPath);
  }

  void populateDB(Database database, int version) async {
    await database.execute("CREATE TABLE $appUser ("
        "$name TEXT,"
        "$mobile TEXT,"
        ")");
  }

}