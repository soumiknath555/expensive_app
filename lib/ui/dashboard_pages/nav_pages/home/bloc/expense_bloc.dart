import 'package:expense_app/data/model/expance_model.dart';
import 'package:expense_app/data/repository/expanse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expanse_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState>{

  ExpenseRepository expenseRepository;
  ExpenseBloc({required this.expenseRepository}) : super(ExpenseInitialState()){
    on<AddExpenseEvent>((event, emit)async {
      emit(ExpenseLoadingState());
      bool check = await expenseRepository.addExpanse(expanseModel: event.newExpense);

      if(check){
        /// get all Expensee.....
        var mExp =await expenseRepository.fetchAllExpense();
        emit(ExpenseLoadedState(allExp: mExp));
      }else{
        emit(ExpenseErrorState(errorMsg: "Expense not added"));
      }
    });

    on<FetchInitialExpenseEvent>((event ,emit ) async {
      emit(ExpenseLoadingState());
      List<ExpenseModel> mExp = await expenseRepository.fetchAllExpense();
      emit(ExpenseLoadedState(allExp: mExp));
    });
  }
}