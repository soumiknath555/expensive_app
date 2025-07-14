import 'package:expense_app/data/model/expance_model.dart';

abstract class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  ExpenseModel newExpense ;
  AddExpenseEvent ({required this.newExpense});
}

class FetchInitialExpenseEvent extends ExpenseEvent {}