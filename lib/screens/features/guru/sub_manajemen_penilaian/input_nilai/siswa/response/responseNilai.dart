import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/server/api.dart';
import 'package:school_apps/helper/utils_apps.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../main.dart';
import '../siswa_screen.dart';

Codec<String, String> stringToBase64 = utf8.fuse(base64);
bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class Nilairesponse {
  static Future inputNilai(datas, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    List<dynamic> dataNilai = datas;
    try {
      final response = await http.post(inputNilaiSiswa,
          headers: headers, body: jsonEncode(dataNilai));
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
                    Navigator.pushNamed(context, ListNilaiSiswa.routeName,
                        arguments: {
                          "idKomponen": ListNilaiSiswa.dataMapel['idKomponen'],
                          "namaKomponen" : ListNilaiSiswa.dataMapel['namaKomponen'],
                          "Tahun" : ListNilaiSiswa.dataMapel['Tahun'],
                          "NIP" : ListNilaiSiswa.dataMapel['NIP'],
                          "semester": ListNilaiSiswa.dataMapel['semester'],
                          "Namamapel": ListNilaiSiswa.dataMapel['Namamapel'],
                          "Semester": ListNilaiSiswa.dataMapel['Semester'],
                          'idkelompokkls': ListNilaiSiswa.dataMapel['idkelompokkls'],
                          'KelompokKelas': ListNilaiSiswa.dataMapel['KelompokKelas'],
                          'idMapel': ListNilaiSiswa.dataMapel['idMapel'],
                          'Jurusan': ListNilaiSiswa.dataMapel['Jurusan'],
                          'NamaKelompokKelas': ListNilaiSiswa.dataMapel['NamaKelompokKelas'],
                        });
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
