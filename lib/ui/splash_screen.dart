import 'package:expense_app/ui/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(

            children: [
              SizedBox(height: 80,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/images/logo_expansive.png")),

                  Text("Monety",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black
                  ),),
                ],
              ),

              SizedBox(height: 100,),
              
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset("assets/images/splash_main_image.png"),
                ),
              ),

              SizedBox(height: 30,),

              Text("Easy way to monitor \n \t\t\t\t\t your expense",
                style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              
              Text("Safe your future by managing your \n  \t\t\t\t\t expense right now",
                style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.w500),)



            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Home_Page();
        }));
      },
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.arrow_forward),),
    );
  }
}