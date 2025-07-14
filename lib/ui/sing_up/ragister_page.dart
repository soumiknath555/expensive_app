import 'package:expense_app/data/model/user_model.dart';
import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/sing_up/bloc/user_bloc.dart';
import 'package:expense_app/ui/sing_up/bloc/user_event.dart';
import 'package:expense_app/ui/sing_up/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobContriller = TextEditingController();

  bool isLoading = false;

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
                controller:  nameController,
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
                controller: mobContriller ,
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
                controller: emailController,
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
                controller: passController,
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

              StatefulBuilder(
                builder: (context, ss) {
                  return SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: BlocListener<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is UserLoadingState) {
                          isLoading = true;
                          ss(() {});
                        }

                        if (state is UserSuccessState) {
                          isLoading = false;
                          ss(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Successfully Registered!!"),
                            ),
                          );
                          Navigator.pushNamed(context, AppRoutes.LOGIN_PAGE);
                        }

                        if (state is UserFailureState) {
                          isLoading = false;
                          ss(() {});

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(" ${state.errorMsg}"),
                              duration: Duration(seconds: 2),
                            ),
                          );

                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          /// SingUp / Register.....

                          UserModel mUser = UserModel(
                            name: nameController.text,
                            email: emailController.text,
                            mobNo: mobContriller.text,
                            pass: passController.text,
                          );

                          context.read<UserBloc>().add(
                            SingUpEvent(user: mUser),
                          );
                          Navigator.pushNamed(context, AppRoutes.LOGIN_PAGE);
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                        ),
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 11),
                                  Text("Loading"),
                                ],
                              )
                            : Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  );
                },
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
