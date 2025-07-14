import 'package:expense_app/data/model/expance_model.dart';

abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState{}
class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoadedState extends ExpenseState{
  List<ExpenseModel> allExp ;
  ExpenseLoadedState({required this.allExp});
}
class ExpenseErrorState extends ExpenseState{
  String errorMsg ;
  ExpenseErrorState ({required this.errorMsg});
}