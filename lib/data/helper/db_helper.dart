import 'dart:io';

import 'package:expense_app/data/model/expance_model.dart';
import 'package:expense_app/data/model/user_model.dart';
import 'package:expense_app/utils/app_constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper getInstance() => DBHelper._();

  Database? mDB;

  ///  USER TABLE ...................

  static const TABLE_USER = "user";
  static const COLUMN_USER_ID = "uid";
  static const COLUMN_USER_NAME = "user_name";
  static const COLUMN_USER_EMAIL = "uesr_email";
  static const COLUMN_USER_MOB_NO = "user_mob_no";
  static const COLUMN_USER_PASS = "user_password";

  /// EXPANSE TABLE .....................

  static const TABLE_EXPENSE = "expanse";
  static const COLUMN_EXPENSE_ID = "expanse_id";
  static const COLUMN_EXPENSE_TITLE = "expanse_title";
  static const COLUMN_EXPENSE_DESCRIPTION = "expanse_description";
  static const COLUMN_EXPENSE_AMOUNT = "expanse_amount";
  static const COLUMN_EXPENSE_BALLENCE = "expance_ballence";
  static const COLUMN_EXPENSE_CREATED_AT = "created_at";
  static const COLUMN_EXPENSE_CAT_ID = "cat_id";
  static const COLUMN_EXPENSE_TYPE = "expance_type";

  Future<Database> initDB() async {
    if (mDB == null) {
      mDB = await openDB();
    }
    return mDB!;
  }

  Future<Database> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path, "expenseDB.db");
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $TABLE_USER ($COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT , $COLUMN_USER_NAME TEXT ,$COLUMN_USER_EMAIL TEXT, $COLUMN_USER_MOB_NO TEXT , $COLUMN_USER_PASS TEXT)",
        );
        db.execute(
          "CREATE TABLE $TABLE_EXPENSE ("
              "$COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
              " $COLUMN_USER_ID INTEGER ,"
              "$COLUMN_EXPENSE_TITLE TEXT , "
              "$COLUMN_EXPENSE_DESCRIPTION TEXT , "
              "$COLUMN_EXPENSE_AMOUNT INTEGER ,"
              "$COLUMN_EXPENSE_BALLENCE INTEGER ,"
              "$COLUMN_EXPENSE_CREATED_AT TEXT , "
              "$COLUMN_EXPENSE_CAT_ID INTEGER,"
              " $COLUMN_EXPENSE_TYPE INTEGER)",
        );
      },
    );
  }

  //// EVENT ..............

  Future<bool> registerUser({required UserModel user}) async {
    var db = await initDB();
    int rowsEffected = await db.insert(TABLE_USER, user.toMap());
    return rowsEffected > 0;
  }

  Future<bool> checkIfEmailExists({required String email}) async {
    var db = await initDB();

    var data = await db.query(
      TABLE_USER,
      where: "$COLUMN_USER_EMAIL = ?",
      whereArgs: [email],
    );
    return data.isNotEmpty;
  }

  Future<bool> athanticateUser({required String email, required String pass}) async {
    var db1 = await initDB();

    List<Map<String, dynamic>> allData = await db1.query(
      TABLE_USER,
      where: "$COLUMN_USER_EMAIL =? and $COLUMN_USER_PASS = ?",
      whereArgs: [email, pass],
    );
    // add user id in prefs .....
    
    if (allData.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(AppConstance.PREF_USER_ID_KEY, allData[0][COLUMN_USER_ID]);
    }  

    return allData.isNotEmpty;

  }

  Future<bool> addNewExpanse({required ExpenseModel newExp}) async {
    var db = await initDB();
    int rowsEffected = await db.insert(TABLE_EXPENSE, newExp.toMap());
    return rowsEffected > 0;
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    var db = await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt(AppConstance.PREF_USER_ID_KEY) ?? 0;
    List<Map<String, dynamic>> mData = await db.query(
      TABLE_EXPENSE, where: '$COLUMN_USER_ID =?',
      whereArgs: ["$uid"],
    );
    List<ExpenseModel> allExp = [];

    for (int i = 0; i < mData.length; i++) {
      allExp.add(ExpenseModel.fromMap(mData[i]));
    }
    return allExp;
  }

  Future<bool> deleteExpanse({required int expanseId}) async {
    var db = await initDB();
    int rowsDeleted = await db.delete(
      TABLE_EXPENSE,
      where: '$COLUMN_EXPENSE_ID = ?',
      whereArgs: [expanseId],
    );
    return rowsDeleted > 0;
  }
}
