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
import '../kategori_nilai_screen.dart';

Codec<String, String> stringToBase64 = utf8.fuse(base64);
bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class KomponenNilaiResponse {
  static Future inputKomponenNilaiRes(
      namaKomponen,
      idkomponen,
      bobot,
      nip,
      String kodeMapel,
      String tahun,
      semester,
      String idKelompokKelas,
      BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.post(inputKomponenNilai,
          headers: headers,
          body: jsonEncode(<String, String>{
            "nama_komponen": namaKomponen,
            "idkomponen": idkomponen,
            "bobot": bobot,
            "nip": nip,
            "kode_mapel": kodeMapel,
            "tahun": tahun,
            "semester": semester,
            "idkelompokkls": idKelompokKelas
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
                    // if(type == 'pengetahuan') {
                    Navigator.pushNamed(context, InputKategoriNilai.routeName,
                        arguments: InputKategoriNilai.dataMapelFromRoutes);
                    // }else {
                    //   Navigator.pushNamed(context, InputKategoriNilaiKeterampilan.routeName,
                    //       arguments: InputKategoriNilaiKeterampilan.dataMapelFromRoutes);
                    // }
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

  static Future updateKomponenNilaiRes(
      namaKomponen,
      type,
      bobot,
      nip,
      String kodeMapel,
      String tahun,
      semester,
      String idKelompokKelas,
      idKomponen,
      BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.put("${updateKomponenNilai}${idKomponen}",
          headers: headers,
          body: jsonEncode(<String, String>{
            "nama_komponen": namaKomponen,
            "idkomponen": type,
            "bobot": bobot,
            "nip": nip,
            "kode_mapel": kodeMapel,
            "tahun": tahun,
            "semester": semester,
            "idkelompokkls": idKelompokKelas
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
                    Navigator.pushNamed(context, InputKategoriNilai.routeName,
                        arguments: InputKategoriNilai.dataMapelFromRoutes);
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

  static Future hapusKomponenNilaiRes(id, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response =
          await http.delete('${hapusKomponenNilai}${id}', headers: headers);
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
                    Navigator.pushNamed(context, InputKategoriNilai.routeName,
                        arguments: InputKategoriNilai.dataMapelFromRoutes);
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
