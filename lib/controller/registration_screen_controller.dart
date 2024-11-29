import 'dart:developer';

import 'package:authentication_task/model/res_model.dart';
import 'package:authentication_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreenController with ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;

  Future<void> onRegister({
    required String name,
    required String phone,
    required String place,
    required String pincode,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://freeapi.luminartechnohub.com/registration/");
    try {
      final res = await http.post(url, body: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "pincode": pincode,
        "place": place,
      });
      print(res.body);
      if (res.statusCode < 250) {
        isSuccess = true;
        notifyListeners();
        log("registration success");

        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    isSuccess = false;
    notifyListeners();
  }

  Future<void> onLogin(
      {required String email, required String password}) async {
    final url = Uri.parse("https://freeapi.luminartechnohub.com/login");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response =
          await http.post(url, body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final responseObj = resModelFromJson(response.body);
        prefs.setString("access", responseObj.access.toString());
        prefs.setString("refresh", responseObj.refresh.toString());
        log("login success");
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
