import 'package:expense_app/data/helper/db_helper.dart';
import 'package:flutter/foundation.dart';

class ExpamceModel {
  int? id;
  int user_id;
  String title;
  String description;
  num amt;
  num bal;
  int cat_id;
  String created_at;
  int type;

  ExpamceModel({
    this.id,
    required this.user_id,
    required this.title,
    required this.description,
    required this.amt,
    required this.bal,
    required this.cat_id,
    required this.created_at,
    required this.type,
}) ;

  factory ExpamceModel.fromMap(Map<String , dynamic> map){
    return ExpamceModel(
      id: map[DBHelper.COLUMN_EXPANSE_ID],
        user_id: map[DBHelper.COLUMN_USER_ID],
        title: map[DBHelper.COLUMN_EXPANSE_TITLE],
        description:map[DBHelper.COLUMN_EXPANSE_DESCRIPTION],
        amt: map[DBHelper.COLUMN_EXPANSE_AMOUNT],
        bal: map[DBHelper.COLUMN_EXPANSE_BALLENCE],
        cat_id: map[DBHelper.COLUMN_EXPANSE_CAT_ID],
        created_at: map[DBHelper.COLUMN_EXPANSE_CREATED_AT],
        type: map[DBHelper.COLUMN_EXPANSE_TYPE],
    );
  }

  Map<String,dynamic> toMap (){
    return {
      DBHelper.COLUMN_USER_ID: user_id,
      DBHelper.COLUMN_EXPANSE_TYPE: title,
      DBHelper.COLUMN_EXPANSE_DESCRIPTION: description,
      DBHelper.COLUMN_EXPANSE_AMOUNT: amt,
      DBHelper.COLUMN_EXPANSE_BALLENCE: bal,
      DBHelper.COLUMN_EXPANSE_CAT_ID: cat_id,
      DBHelper.COLUMN_EXPANSE_CREATED_AT: created_at,
      DBHelper.COLUMN_EXPANSE_TYPE: type,

    };
  }





}