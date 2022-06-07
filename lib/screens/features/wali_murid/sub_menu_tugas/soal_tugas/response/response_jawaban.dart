import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai_keterampilan_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai.dart';
import 'package:school_apps/screens/login_success/login_success_screen.dart';
import 'package:school_apps/server/api.dart';
import 'package:school_apps/helper/utils_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';

Codec<String, String> stringToBase64 = utf8.fuse(base64);
bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class WaliMuridJawabanResponse2{
  static Future inputJawabanRes(
      jawaban,
      BuildContext context) async {
    // utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.post(inputJawaban,
          headers: headers,
          body: jsonEncode(jawaban));
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        // Future.delayed(Duration(seconds: 1)).then((value) {
          // utilsApps.hideDialog(context);
          // AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.SUCCES,
          //     animType: AnimType.RIGHSLIDE,
          //     headerAnimationLoop: true,
          //     title: 'Peringatan',
          //     desc: responseJson['message'],
          //     btnOkOnPress: () {
          //       Navigator.pushNamed(
          //           context, SoalTugasSiswa.routeName,
          //           arguments: {
          //             "idDetailSoal": SoalTugasSiswa.dataTugas['idDetailSoal'],
          //             "idTugas": DetailTugasSiswa.dataTugasFromDetailTugas['id'],
          //             "keterangan": DetailTugasSiswa.dataTugasFromDetailTugas['keterangan'],
          //           });
          //     },
          //     btnOkIcon: Icons.check,
          //     btnOkColor: kColorTealToSlow)
          //     .show();
        // });
      } else {
        // Future.delayed(Duration(seconds: 1)).then((value) {
        //   utilsApps.hideDialog(context);
        //   AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.WARNING,
        //       animType: AnimType.RIGHSLIDE,
        //       headerAnimationLoop: true,
        //       title: 'Peringatan',
        //       desc: responseJson['message'],
        //       btnOkOnPress: () {},
        //       btnOkIcon: Icons.cancel,
        //       btnOkColor: kColorYellow)
        //       .show();
        //   // utilsApps.dengerSnack(context, responseJson['message']);
        // });
      }
      // print(dataUser);
    } catch (e) {
      // Future.delayed(Duration(seconds: 1)).then((value) {
      //   utilsApps.hideDialog(context);
      //   AwesomeDialog(
      //       context: context,
      //       dialogType: DialogType.ERROR,
      //       animType: AnimType.RIGHSLIDE,
      //       headerAnimationLoop: true,
      //       title: 'Peringatan',
      //       desc: "Terjadi kesalahan pada server",
      //       btnOkOnPress: () {},
      //       btnOkIcon: Icons.cancel,
      //       btnOkColor: kColorRedSlow)
      //       .show();
      // });
    }
  }

  static Future inputJawabanPgRes(
      jawaban,
      BuildContext context) async {
    // utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.post(inputJawabanPg,
          headers: headers,
          body: jsonEncode(jawaban));
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        // Future.delayed(Duration(seconds: 1)).then((value) {
        //   // utilsApps.hideDialog(context);
        //   AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.SUCCES,
        //       animType: AnimType.RIGHSLIDE,
        //       headerAnimationLoop: true,
        //       title: 'Peringatan',
        //       desc: responseJson['message'],
        //       btnOkOnPress: () {
        //         Navigator.pushNamed(
        //             context, SoalTugasSiswa.routeName,
        //             arguments: {
        //               "idDetailSoal": SoalTugasSiswa.dataTugas['idDetailSoal'],
        //               "idTugas": DetailTugasSiswa.dataTugasFromDetailTugas['id'],
        //               "keterangan": DetailTugasSiswa.dataTugasFromDetailTugas['keterangan'],
        //             });
        //       },
        //       btnOkIcon: Icons.check,
        //       btnOkColor: kColorTealToSlow)
        //       .show();
        // });
      } else {
        // Future.delayed(Duration(seconds: 1)).then((value) {
        //   // utilsApps.hideDialog(context);
        //   AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.WARNING,
        //       animType: AnimType.RIGHSLIDE,
        //       headerAnimationLoop: true,
        //       title: 'Peringatan',
        //       desc: responseJson['message'],
        //       btnOkOnPress: () {},
        //       btnOkIcon: Icons.cancel,
        //       btnOkColor: kColorYellow)
        //       .show();
        //   // utilsApps.dengerSnack(context, responseJson['message']);
        // });
      }
      // print(dataUser);
    } catch (e) {
      // Future.delayed(Duration(seconds: 1)).then((value) {
      //   // utilsApps.hideDialog(context);
      //   AwesomeDialog(
      //       context: context,
      //       dialogType: DialogType.ERROR,
      //       animType: AnimType.RIGHSLIDE,
      //       headerAnimationLoop: true,
      //       title: 'Peringatan',
      //       desc: "Terjadi kesalahan pada server",
      //       btnOkOnPress: () {},
      //       btnOkIcon: Icons.cancel,
      //       btnOkColor: kColorRedSlow)
      //       .show();
      // });
    }
  }

  static Future inputJawabanFileRes(
      id_soal, idDetailTugas, nisn, jawaban_file, BuildContext context) async {
    utilsApps.showDialog(context);
    print(jawaban_file);
    try {
      var req = http.MultipartRequest("POST", Uri.parse(inputJawabanFile));
      req.headers['x-access-token'] = data['access_token'];
      req.headers['username'] = data['username'];
      req.fields['id_soal'] = id_soal;
      req.fields['idDetailTugas'] = idDetailTugas;
      req.fields['nisn'] = nisn;
      req.files.add(
        await http.MultipartFile.fromPath('jawaban_file', jawaban_file),
      );

      var res = await req.send();
      var strRes = await res.stream.bytesToString();
      responseJson = json.decode(strRes);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['message'],
              btnOkOnPress: () {
                // Navigator.pushNamed(context, DetailTugas.routeName,
                //     arguments: {"id": InputSoalEssay.data['idTugas']});
              },
              btnOkIcon: Icons.check,
              btnOkColor: kColorTealToSlow)
              .show();
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
      print(e);
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
