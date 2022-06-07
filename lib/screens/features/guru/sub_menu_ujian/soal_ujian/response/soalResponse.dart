import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/input_soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/detail_ujian_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:school_apps/helper/utils_apps.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import '../soal_ujian_screens.dart';
import '../update_soal_ujian.dart';

Codec<String, String> stringToBase64 = utf8.fuse(base64);
bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class SoalUjianResponse {
  static Future inputSoalRes(soal, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    List<dynamic> dataSoal = soal;
    try {
      final response = await http.post(createSoalEssay,
          headers: headers, body: jsonEncode(dataSoal));
      responseJson = json.decode(response.body);
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
                    Navigator.pushNamed(context, DetailUjian.routeName,
                        arguments: {"id": InputSoalUjian.data['idTugas']});
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

  static Future inputSoalFileRes(
      soal, file, id_tugas, jumlahSoal, type, BuildContext context) async {
    utilsApps.showDialog(context);

    try {
      var req = http.MultipartRequest("POST", Uri.parse(createSoalFile));
      req.headers['x-access-token'] = data['access_token'];
      req.headers['username'] = data['username'];
      req.fields['soal'] = soal;
      req.fields['id_tugas'] = id_tugas;
      req.fields['idTugas'] = id_tugas;
      req.fields['jumlahSoal'] = jumlahSoal;
      req.fields['type'] = type;
      req.files.add(
        await http.MultipartFile.fromPath('file', file),
      );

      var res = await req.send();
      var strRes = await res.stream.bytesToString();
      responseJson = json.decode(strRes);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          print(InputSoalUjian.data['idTugas']);
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['message'],
                  btnOkOnPress: () {
                    Navigator.pushNamed(context, DetailUjian.routeName,
                        arguments: {"id": InputSoalUjian.data['idTugas']});
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

  static Future updateSoalRes(soal, id, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.put('${updateSoalEssay}$id',
          headers: headers,
          body: jsonEncode(<String, String>{
            "soal": soal
          }));
      responseJson = json.decode(response.body);
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
                    Navigator.pushNamed(context, SoalUjian.routeName,
                        arguments: UpdateSoalUjian.data);
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
