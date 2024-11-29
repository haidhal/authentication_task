import 'dart:developer';

import 'package:authentication_task/model/getprofile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController with ChangeNotifier {
  GetProfileModel? profileList;
  bool isLoading = false;
  String errorMessage = "";
  Future<void> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading = true;
    errorMessage = "";
    notifyListeners();
    final url = Uri.parse("https://freeapi.luminartechnohub.com/profile/");
    try {
      final res = await http.get(url,
          headers: {"Authorization": "Bearer ${prefs.getString("access")}"});
      if (res.statusCode == 200) {
        profileList = getProfileModelFromJson(res.body);
        log(profileList!.data!.name.toString());
        log(res.body);
      } else {
        errorMessage =
            'Failed to fetch profile. Status code: ${res.statusCode}';
        log(errorMessage);
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}


