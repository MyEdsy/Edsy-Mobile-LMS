import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/login_success/login_success_screen.dart';
import 'package:school_apps/server/api.dart';
import 'package:school_apps/helper/utils_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

Codec<String, String> stringToBase64 = utf8.fuse(base64);
bool status = false;
int code = 0;
var responseJson;
var dataUser = {};

class usersResponse {

  static void loginResponse(username, password, BuildContext context) async {
    utilsApps.showDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Authorization':
          'Basic ' + stringToBase64.encode(username + ":" + password)
    };

    try {
      final response = await http.post(signIn, headers: headers);
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        dataUser = responseJson['result'];
        sharedPreferences.setString('dataUser', jsonEncode(dataUser));
        sharedPreferences.setBool('login', true);
        sharedPreferences.commit();
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          Navigator.pushNamed(context, LoginSuccessScreen.routeName,
              arguments: dataUser);
        });
      } else {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['message'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: "Terjadi kesalahan pada server",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }
}
