import 'package:sqflite/sqflite.dart';

import 'dataBase.dart';
import 'dbEntity.dart';

class AppUserRepo {
  DbConnection dbConnection = DbConnection();
  Future<int> createUserDetail(AppUser user) async {
    final Database db = await dbConnection.createDB();
    int result = await db.insert(dbConnection.appUser, user.toJson());
    await db.close();
    return result;
  }

  Future<List<AppUser>> getUserDetails() async {
    final Database db = await dbConnection.createDB();
    List<Map<String, dynamic>> result = await db.query(dbConnection.appUser);
    await db.close();
    return List.generate(result.length, (i) {
      return AppUser.fromJson(result[i]);
    });
  }

  Future<AppUser> getUserDetail() async {
    List<AppUser> users = await getUserDetails();
    return users[0];
  }

  Future<int> getUserDetailsCount() async {
    final Database db = await dbConnection.createDB();
    int i = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbConnection.appUser}'));
    await db.close();
    return i;
  }

  deleteUserDetail() async {
    final Database db = await dbConnection.createDB();
    await db.delete(dbConnection.appUser);
    await db.close();
  }
}
