import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  _getDataUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dataUserLogin = sharedPreferences.getString("dataUser");
  }

  @override
  Widget build(BuildContext context) {
    _getDataUsers();
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(),
            title: Text("Login Success"),
          ),
          body: Body(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    exit(0);
  }
}
