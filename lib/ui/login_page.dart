import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Expance",style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.green),),
              SizedBox(height: 11,),

              TextField(

                decoration: InputDecoration(
                  hintText: "Name......",
                  label: Text("Name"),
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),

                  enabledBorder: OutlineInputBorder(),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2)
                  )
                ),

              ),
              SizedBox(height: 10,),

              TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number....",
                  label: Text("Phone Number"),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  prefixIcon: Icon(Icons.phone),
                  border:OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38,width: 1.5)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2)
                  )
                ),
              ),

              SizedBox(height: 10,),

              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  label: Text("Password"),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2)
                  )
                ),
              ),
              
              SizedBox(height: 25,),
              
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Home_Page();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),child: Text("Login",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),),
              ),
              
              SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't have an Account..."),
                  /// SizedBox(width: 2,),
                  
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, AppRoutes.REGISTER_PAGE);
                  }, child: Text("Register ",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightBlue
                    ),))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
