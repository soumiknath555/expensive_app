import 'package:expense_app/data/model/user_model.dart';
import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/sing_up/bloc/user_bloc.dart';
import 'package:expense_app/ui/sing_up/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobContriller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              SizedBox(height: 11),

              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  hintText: "Name",
                  label: Text("Name"),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  // fillColor: Colors.green,
                  //focusColor: Colors.lightBlueAccent
                ),
              ),

              SizedBox(height: 11),

              TextField(
                decoration: InputDecoration(
                  label: Text("Phone Number"),
                  hintText: "Phone Number",
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 11),

              TextField(
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Email",
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 11),

              TextField(
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Password",
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 11),

              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    /// SingUp / Register.....

                    UserModel mUser = UserModel(
                      name: nameController.text,
                      email: emailController.text,
                      mobNo: mobContriller.text,
                      pass: passController.text,
                    );

                    context.read<UserBloc>().add(SingUpEvent(user: mUser));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alrady have an Account!!  "),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.LOGIN_PAGE);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
