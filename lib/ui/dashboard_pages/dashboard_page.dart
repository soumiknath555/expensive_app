import 'package:expense_app/ui/add_page/add_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_pages/home/home_page.dart';
import 'nav_pages/stats/stats_page.dart';

class DashboardPage extends StatefulWidget {

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPageIndex = 0;

  List<Widget> navPages = [
    Home_Page(),
    AddPage(),
    StatsPage(),


  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: navPages[selectedPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
          selectedItemColor: Colors.green,
          onTap: ((index){
            selectedPageIndex = index;
            setState(() {

            });
          }),
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(11)
              ),
                child: Icon(Icons.add,size: 30, color: Colors.white,)),label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics),label: "Stats"),

      ]),
    );
  }
}