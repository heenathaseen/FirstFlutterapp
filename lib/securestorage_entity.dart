import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqflite/sqflite.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyemail = "useremail";
  static const _keypassword = "userpass";

  static Future setEmail(String email) async =>
      await _storage.write(key: _keyemail, value: email);

  static Future<String> getEmail() async => await _storage.read(key: _keyemail);

  static Future setPass(String pass) async =>
      await _storage.write(key: _keypassword, value: pass);

  static Future<String> getPass() async =>
      await _storage.read(key: _keypassword);
}
