import 'package:authentication_task/controller/home_screen_controller.dart';
import 'package:authentication_task/controller/registration_screen_controller.dart';
import 'package:authentication_task/view/registration_screen/registation_sceen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(create: (context) => HomeScreenController(),)
      ],
      child: MaterialApp(
        home: RegistrationScreen(),
      ),
    );
  }
}
