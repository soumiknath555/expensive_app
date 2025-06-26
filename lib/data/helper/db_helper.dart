import 'dart:io';

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
  static const COLUMN_EXPANS_TITLE ="expanse_title";
  static const COLUMN_EXPANS_DESCRIPTION ="expanse_description";
  static const COLUMN_EXPANS_AMOUNT ="expanse_amount";
  static const COLUMN_EXPANCE_BALLENCE = "expance_ballence";
  static const COLUMN_EXPANCE_CREATED_AT ="created_at";
  static const COLUMN_EXPANCE_CAT_ID = "cat_id";
  static const COLUMN_EXPANCE_TYPE ="expance_type";



  Future<Database> initDB()async{
 if (mDB == null){
   mDB = await openDB();
 } return mDB! ;
  }

  Future<Database> openDB()async{
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path);
    return await openDatabase(dbPath ,version:  1,onCreate: (db ,version){
      db.execute("CREATE TABLE $TABLE_USER ($COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT , $COLUMN_USER_NAME TEXT ,$COLUMN_USER_EMAIL TEXT, $COLUMN_USER_MOB_NO TEXT , $COLUMN_USER_PASS TEXT)");
      db.execute("CREATE TABLE $TABLE_EXPANSE($COLUMN_EXPANSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_USER_ID INTEGER ,$COLUMN_EXPANS_TITLE TEXT , $COLUMN_EXPANS_DESCRIPTION TEXT , $COLUMN_EXPANS_AMOUNT INTEGER ,$COLUMN_EXPANCE_BALLENCE INTEGER ,$COLUMN_EXPANCE_CREATED_AT TEXT ,$COLUMN_EXPANCE_CAT_ID INTEGER, $COLUMN_EXPANCE_TYPE TEXT)");

    } );

  }

  registerUser(){}





}