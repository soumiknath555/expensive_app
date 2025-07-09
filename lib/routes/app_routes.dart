import 'package:expense_app/ui/add_page/add_page.dart';
import 'package:expense_app/ui/home_page.dart';
import 'package:expense_app/ui/login_page.dart';
import 'package:expense_app/ui/sing_up/ragister_page.dart';
import 'package:expense_app/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class AppRoutes {

  static const String SPLASH_PAGE = "/splash";
  static const String HOME_PAGE = "/home";
  static const String LOGIN_PAGE = "/login";
  static const String REGISTER_PAGE = "/register";
  static const String ADD_EXPANCE_PAGE = "/add_expanse";
  static const String STATS_PAGE = "/stats";

 static Map<String, Widget Function(BuildContext) > routes = {

    SPLASH_PAGE : (context) => SplahScreen(),
    HOME_PAGE : (context) => Home_Page(),
    LOGIN_PAGE : (context) => LoginPage(),
   REGISTER_PAGE : (context) => RegisterPage(),
   ADD_EXPANCE_PAGE : (context) => AddPage(),
  };

}