import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main (){

  runApp(MaterialApp(
    initialRoute: AppRoutes.SPLASH_PAGE,
    routes: AppRoutes.routes,
  ));

}