import 'package:expense_app/routes/app_routes.dart';
import 'package:expense_app/ui/sing_up/bloc/user_bloc.dart';
import 'package:expense_app/ui/sing_up/bloc/user_event.dart';
import 'package:expense_app/ui/sing_up/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneControlar = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isLoding = false;

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
              Text(
                "Expance",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 11),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name......",
                  label: Text("Name"),
                  fillColor: Colors.green.shade50,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),

                  enabledBorder: OutlineInputBorder(),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: phoneControlar,
                decoration: InputDecoration(
                  hintText: "Phone Number....",
                  label: Text("Phone Number"),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  label: Text("Email"),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  label: Text("Password"),
                  filled: true,
                  fillColor: Colors.green.shade50,
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (_, state) {
                    if (state is UserLoadingState) {
                      isLoding = true;
                    }

                    if (state is UserFailureState) {
                      isLoding = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)));
                    }
                    if(state is UserSuccessState){
                      isLoding = false;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully!!!")));
                      Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD_PAGE);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                          LoginEvent(
                            email: emailController.text,
                            pass: passwordController.text,
                          ),
                        );

                        /*  Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Home_Page();
                      }));*/
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      child: isLoding
                          ? Row(
                        children: [
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          SizedBox(width: 5,),
                          Text("Login.."),
                        ],
                      )
                          : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't have an Account..."),

                  /// SizedBox(width: 2,),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.REGISTER_PAGE);
                    },
                    child: Text(
                      "Register ",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlue,
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
