import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai_keterampilan_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/input_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/update_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/input_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/update_ujian_screens.dart';
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

class UjianResponse {
  static Future inputTugasRes(
      nip,
      id_kelompok_kelas,
      // type,
      tgl_mulai,
      tgl_selesai,
      id_komponen_nilai,
      keterangan,
      id_mapel,
      tahun,
      semester,
      nama_tugas,
      jenis_tugas,
      BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.post(inputTugas,
          headers: headers,
          body: jsonEncode(<String, String>{
            "nip": nip,
            "id_kelompok_kelas": id_kelompok_kelas,
            // "type": type,
            "tgl_mulai": tgl_mulai,
            "tgl_selesai": tgl_selesai,
            "id_komponen_nilai": id_komponen_nilai,
            "keterangan": keterangan,
            "id_mapel": id_mapel,
            "tahun": tahun,
            "semester": semester,
            "nama_tugas": nama_tugas,
            "jenis_tugas": jenis_tugas,
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
                Navigator.pushNamed(context, MenuUjian.routeName,
                    arguments: InputUjian.dataMapelPerIndex);
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

  static Future updateTugasRes(idTugas, nama_tugas, keterangan, tgl_mulai,
      tgl_selesai, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.put('${updateTugas}$idTugas',
          headers: headers,
          body: jsonEncode(<String, String>{
            "nama_tugas": nama_tugas,
            "keterangan": keterangan,
            "tgl_mulai": tgl_mulai,
            "tgl_selesai": tgl_selesai,
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
                Navigator.pushNamed(context, MenuUjian.routeName,
                    arguments: UpdateUjian.dataMapelPerIndex);
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
