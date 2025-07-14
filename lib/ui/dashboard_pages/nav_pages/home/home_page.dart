import 'dart:math';

import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expanse_event.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expense_bloc.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expense_state.dart';
import 'package:expense_app/utils/app_constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../routes/app_routes.dart';

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchInitialExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              child: Image.asset("assets/images/logo_expansive.png"),
            ),
            Text(
              "Monety",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Spacer(),

            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Log Out ?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),


                              SizedBox(height: 30),


                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OutlinedButton(
                                    onPressed: () async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setInt(AppConstance.PREF_USER_ID_KEY, 0);
                                      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_PAGE);

                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.red,fontSize: 20),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(color: Colors.green,fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout, color: Colors.red),
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage("assets/images/soumik_profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morning",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                        Text("Soumik Nath", style: TextStyle(fontSize: 20)),
                      ],
                    ),

                    Spacer(),

                    Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.blue.shade50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('This month', style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Expense total',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        '\$3734',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                '\$-240',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'than last month',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Expense List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: BlocBuilder<ExpenseBloc ,ExpenseState>(builder: (_,state){

                    if (state is ExpenseLoadingState){
                      return Center(child:CircularProgressIndicator());
                    }

                    if(state is ExpenseLoadedState){
                      return state.allExp.isNotEmpty ? ListView.builder(
                          itemCount: state.allExp.length,
                          itemBuilder:(_,index){
                            String imgPath = AppConstance.mCatList.where((e){
                              return e.catId  == state.allExp[index].cat_id;
                            }).toList()[0].catIamge;
                        return Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(7),
                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              child: Image.asset(imgPath)
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.allExp[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.allExp[index].description,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '${state.allExp[index].bal}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.pink.shade200,
                              ),
                            ),
                          ],
                        );

                      } ) : Center(
                        child: Text(" No Expenses found!!"),
                      );
                    }


                    if (state is ExpenseErrorState){
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }

                    return Container();
                  })
              ),
            ],
          )
        ),
      )
    );
  }
}
