import 'package:expense_app/data/helper/db_helper.dart';
import 'package:expense_app/data/repository/expanse_repository.dart';
import 'package:expense_app/data/repository/user_repository.dart';
import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expense_bloc.dart';
import 'package:expense_app/ui/sing_up/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>UserBloc(userRepository: UserRepository(dbHelper: DBHelper.getInstance()))),
        BlocProvider(create: (_) => ExpenseBloc(expenseRepository: ExpenseRepository(dbHelper: DBHelper.getInstance())))
      ]
      , child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: AppRoutes.routes,
    );
  }
}
