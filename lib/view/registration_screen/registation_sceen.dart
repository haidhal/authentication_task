// ignore_for_file: prefer_const_constructors

import 'package:authentication_task/controller/registration_screen_controller.dart';
import 'package:authentication_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  @override
 
  @override
  Widget build(BuildContext context) {
   // final registerProvider = context.watch<RegistrationScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Now",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20.0),
                //
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0),
                //////////
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!value.contains("@")) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0),
                ///////////
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),
                ///////
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "phone",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone";
                    }
                    if (value.length != 10) {
                      return "phone should contain 10 digits only";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),
                ////////
                TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "place",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your place";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),
                ////////
                TextFormField(
                  controller: pincodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "pincode",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your pincode";
                    }
                    if (value.length != 6) {
                      return "pincode must be exactly 6 digits";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),

                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<RegistrationScreenController>().onRegister(
                            email: emailController.text,
                            name: nameController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            pincode: pincodeController.text,
                            place: placeController.text,
                            context: context,
                          );
                    }
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
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
