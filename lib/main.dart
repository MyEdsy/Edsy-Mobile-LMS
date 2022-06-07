import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_apps/routes.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/guru/home_guru.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

var dataUserLogin;
var dataBaseUrl;
var tahunAjaranPref;
bool? login = false;
bool? setDataIp = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  login = sharedPreferences.getBool("login");
  String defaultRoutes;

  if (login != null) {
    if (login == false) {
      defaultRoutes = Onboarding.routerName;
    } else {
      dataUserLogin = sharedPreferences.getString("dataUser");
      tahunAjaranPref = sharedPreferences.getString("tahunAjaran");
      print(tahunAjaranPref);
      var data = jsonDecode(dataUserLogin);
      if (data['nama_akses'] == 'Guru') {
        defaultRoutes = HomeGuru.routeName;
      } else if (data['nama_akses'] == 'Orang Tua') {
        defaultRoutes = HomeWaliMurid.routeName;
      } else {
        defaultRoutes = HomeSiswa.routeName;
      }
    }
  } else {
    // defaultRoutes = SignInScreen.routeName;
    defaultRoutes = Onboarding.routerName;
  }

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp]
  // ).then((_) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'School Apps',
    theme: theme(),
    initialRoute: defaultRoutes,
    routes: routes,
  ));
  // });
}
