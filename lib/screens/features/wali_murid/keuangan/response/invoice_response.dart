import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/PilihMetodePembayaran.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/TagihanScreens.dart';
import 'package:school_apps/server/api.dart';

import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/helper/utils_apps.dart';


bool status = false;
int code = 0;
var responseJson;
var dataUser = {};
var data = jsonDecode(dataUserLogin);

class Transaksi {
  static Future createTransaksi(kirim, BuildContext context) async {
    utilsApps.showDialog(context);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };
    try {
      final response = await http.post(transaksiXendit,
          headers: headers, body: jsonEncode(kirim));
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
                  desc:
                      'Berhasil memuat permintaan, Klik OK untuk meneruskan pembayaran',
                  btnOkOnPress: () {
                    //https://checkout-staging.xendit.co/web/
                    Navigator.pushNamed(
                        context, WaliMuridPilihMetodePembayaran.routeName,
                        arguments: {'url': responseJson['url'], 'from': 1});
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

  static Future uploadBuktiBayar(
      external_id,
      idsettingsiswa,
      id_paket_pembayaran,
      amount,
      pembayaran,
      payer_email,
      nisn,
      bukti_bayar,
      BuildContext context) async {
    utilsApps.showDialog(context);
    try {
      var req = http.MultipartRequest("POST", Uri.parse(transaksiUploadFile));
      req.headers['x-access-token'] = data['access_token'];
      req.headers['username'] = data['username'];

      req.fields['external_id'] = external_id;
      req.fields['idsettingsiswa'] = idsettingsiswa;
      req.fields['id_paket_pembayaran'] = id_paket_pembayaran;
      req.fields['amount'] = amount;
      req.fields['pembayaran'] = pembayaran;
      req.fields['payer_email'] = payer_email;
      req.fields['nisn'] = nisn;
      req.fields['bukti_bayar'] = bukti_bayar;
      req.files.add(
        await http.MultipartFile.fromPath('bukti_bayar', bukti_bayar),
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
                    Navigator.pushNamed(context, WaliMuridTagihanScreens.routeName);
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
