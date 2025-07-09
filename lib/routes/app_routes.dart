import 'package:expense_app/ui/add_page/add_page.dart';
import 'package:expense_app/ui/dasboard_pages/dashboard_page.dart';
import 'package:expense_app/ui/dasboard_pages/nav_pages/stats/stats_page.dart';
import 'package:expense_app/ui/login/login_page.dart';
import 'package:expense_app/ui/sing_up/ragister_page.dart';
import 'package:expense_app/ui/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import '../ui/dasboard_pages/nav_pages/home/home_page.dart';

class AppRoutes {

  static const String SPLASH_PAGE = "/splash";
  static const String DASHBOARD_PAGE = "/dashbpard";
  static const String LOGIN_PAGE = "/login";
  static const String REGISTER_PAGE = "/register";
  static const String ADD_EXPANCE_PAGE = "/add_expanse";
  static const String STATS_PAGE = "/stats";

 static Map<String, Widget Function(BuildContext) > routes = {

    SPLASH_PAGE : (context) => SplahScreen(),
    DASHBOARD_PAGE : (context) => DashboardPage(),
    LOGIN_PAGE : (context) => LoginPage(),
    REGISTER_PAGE : (context) => RegisterPage(),
    ADD_EXPANCE_PAGE : (context) => AddPage(),
    STATS_PAGE : (context) => StatsPage(),
  };

}