import 'package:expense_app/data/helper/db_helper.dart';

import '../model/expance_model.dart';



class ExpenseRepository {
  DBHelper dbHelper;
  ExpenseRepository({required this.dbHelper});

  Future<bool> addExpanse({required ExpenseModel expanseModel}) async {
    bool check = await dbHelper.addNewExpanse(newExp: expanseModel);
    return check;
  }

  Future< List<ExpenseModel>> fetchAllExpense()async{
    return await dbHelper.getAllExpenses();
  }

  // Delete Expanse..........
  deleteExpanse({required int expanseId}) async {
    bool check = await dbHelper.deleteExpanse(expanseId: expanseId);
  }


}