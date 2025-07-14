import 'package:expense_app/data/helper/db_helper.dart';


class ExpenseModel {
  int? id;
  int user_id;
  String title;
  String description;
  num amt;
  num bal;
  int cat_id;
  String created_at;
  int type;

  ExpenseModel({
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

  factory ExpenseModel.fromMap(Map<String , dynamic> map){
    return ExpenseModel(
      id: map[DBHelper.COLUMN_EXPENSE_ID],
        user_id: map[DBHelper.COLUMN_USER_ID],
        title: map[DBHelper.COLUMN_EXPENSE_TITLE],
        description:map[DBHelper.COLUMN_EXPENSE_DESCRIPTION],
        amt: map[DBHelper.COLUMN_EXPENSE_AMOUNT],
        bal: map[DBHelper.COLUMN_EXPENSE_BALLENCE],
        cat_id: map[DBHelper.COLUMN_EXPENSE_CAT_ID],
        created_at: map[DBHelper.COLUMN_EXPENSE_CREATED_AT],
        type: map[DBHelper.COLUMN_EXPENSE_TYPE],
    );
  }

  Map<String,dynamic> toMap (){
    return {
      DBHelper.COLUMN_USER_ID: user_id,
      DBHelper.COLUMN_EXPENSE_TITLE: title,
      DBHelper.COLUMN_EXPENSE_DESCRIPTION: description,
      DBHelper.COLUMN_EXPENSE_AMOUNT: amt,
      DBHelper.COLUMN_EXPENSE_BALLENCE: bal,
      DBHelper.COLUMN_EXPENSE_CAT_ID: cat_id,
      DBHelper.COLUMN_EXPENSE_CREATED_AT: created_at,
      DBHelper.COLUMN_EXPENSE_TYPE: type,

    };
  }





}