import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/bodyOnboarding.dart';

// class SuccessOnboarding extends StatefulWidget {
//
//   // _SuccessOnboarding createState() => _SuccessOnboarding();
// }

class SuccessOnboarding extends StatelessWidget {
  static String routeName = "/onBoarding_success";

  // _getDataUsers() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   dataUserLogin = sharedPreferences.getString("dataUser");
  // }

  @override
  Widget build(BuildContext context) {
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
