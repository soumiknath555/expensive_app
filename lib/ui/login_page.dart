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
              TextField(

                decoration: InputDecoration(
                  hintText: "Name......",
                  label: Text("Name"),
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
                ),child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
              ),
              
              SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't have an Account..."),
                  /// SizedBox(width: 2,),
                  
                  TextButton(onPressed: (){}, child: Text("Register ",
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
