// ignore_for_file: prefer_const_constructors

// import 'package:authentication_task/controller/registration_screen_controller.dart';
// import 'package:authentication_task/main.dart';

import 'package:authentication_task/controller/registration_screen_controller.dart';
import 'package:authentication_task/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("Login Success"),
            SizedBox(height: 10),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                if (!value.contains("@")) {
                  return "enter valid email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                if (value.length < 6) {
                  return "password must contain 6 characters";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
               context.read<RegistrationScreenController>().onLogin(
                      email: emailcontroller.text,
                      password: passcontroller.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
