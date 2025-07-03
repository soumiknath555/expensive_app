import 'dart:io';

import 'package:expense_app/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  DBHelper._();

  static DBHelper getInstance() => DBHelper._() ;

  Database? mDB ;
  ///  USER TABLE ...................

  static const TABLE_USER ="user";
  static const COLUMN_USER_ID = "uid";
  static const COLUMN_USER_NAME ="user_name";
  static const COLUMN_USER_EMAIL ="uesr_email";
  static const COLUMN_USER_MOB_NO ="user_mob_no";
  static const COLUMN_USER_PASS = "user_password";

  /// EXPANSE TABLE .....................

  static const TABLE_EXPANSE ="expanse";
  static const COLUMN_EXPANSE_ID ="expanse_id";
  static const COLUMN_EXPANSE_TITLE ="expanse_title";
  static const COLUMN_EXPANSE_DESCRIPTION ="expanse_description";
  static const COLUMN_EXPANSE_AMOUNT ="expanse_amount";
  static const COLUMN_EXPANSE_BALLENCE = "expance_ballence";
  static const COLUMN_EXPANSE_CREATED_AT ="created_at";
  static const COLUMN_EXPANSE_CAT_ID = "cat_id";
  static const COLUMN_EXPANSE_TYPE ="expance_type";



  Future<Database> initDB()async{
 if (mDB == null){
   mDB = await openDB();
 } return mDB! ;
  }

  Future<Database> openDB()async{
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path , "expenseDB.db");
    return await openDatabase(dbPath ,version:  1,onCreate: (db ,version){
      db.execute("CREATE TABLE $TABLE_USER ($COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT , $COLUMN_USER_NAME TEXT ,$COLUMN_USER_EMAIL TEXT, $COLUMN_USER_MOB_NO TEXT , $COLUMN_USER_PASS TEXT)");
      db.execute("CREATE TABLE $TABLE_EXPANSE($COLUMN_EXPANSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_USER_ID INTEGER ,$COLUMN_EXPANSE_TITLE TEXT , $COLUMN_EXPANSE_DESCRIPTION TEXT , $COLUMN_EXPANSE_AMOUNT INTEGER ,$COLUMN_EXPANSE_BALLENCE INTEGER ,$COLUMN_EXPANSE_CREATED_AT TEXT ,$COLUMN_EXPANSE_CAT_ID INTEGER, $COLUMN_EXPANSE_TYPE TEXT)");

    } );

  }

  //// EVENT ..............

  Future<bool> registerUser({required UserModel user})async{

      var db =await initDB();
      int rowsEffected = await db.insert(TABLE_USER, user.toMap());
      return rowsEffected >0;

  }

  Future<bool> checkIfEmailExists({required String email})async{
    var db = await initDB();

    var data = await db.query(TABLE_USER , where:  "$COLUMN_USER_EMAIL = ?", whereArgs: [email]);
    return data.isNotEmpty;
  }


}