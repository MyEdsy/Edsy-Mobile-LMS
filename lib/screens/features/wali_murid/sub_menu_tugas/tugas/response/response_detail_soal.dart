import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/detail_quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/detail_tugas_screen.dart';
import 'package:school_apps/server/api.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/helper/utils_apps.dart';

bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class WalimuridKonfirmResponse2{

  static Future konfirmasiJawaban(
      kirim,
      BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };
    try {

      print(kirim);
      final response = await http.post(konfirmasiPengerjaan,
          headers: headers,
          body: jsonEncode(kirim)
      );
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        print("adada");
        Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: 'Berhasil memuat permintaan',
            btnOkOnPress: () {
              Navigator.pushNamed(
                  context, WaliMuridDetailTugasSiswa.routeName,
                  arguments: WaliMuridDetailTugasSiswa.dataTugasFromDetailTugas);
            },
            btnOkIcon: Icons.check,
            btnOkColor: kColorTealToSlow)
            .show();
        });
      } else {
        print("blahhh");
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

  static Future konfirmasiJawabanQuiz(
      kirim,
      BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };
    try {

      print(kirim);
      final response = await http.post(konfirmasiPengerjaan,
          headers: headers,
          body: jsonEncode(kirim)
      );
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        print("adada");
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: 'Berhasil memuat permintaan',
              btnOkOnPress: () {
                Navigator.pushNamed(
                    context, WaliMuridDetailQuizSiswa.routeName,
                    arguments: WaliMuridDetailQuizSiswa.dataTugasFromDetailTugas);
              },
              btnOkIcon: Icons.check,
              btnOkColor: kColorTealToSlow)
              .show();
        });
      } else {
        print("blahhh");
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
