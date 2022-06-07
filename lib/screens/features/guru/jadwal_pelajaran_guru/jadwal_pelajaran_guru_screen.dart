import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_home.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/guru/jadwal_pelajaran_guru/component/body.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../main.dart';
import '../home_guru.dart';

class JadwalPelajaranGuru extends StatefulWidget {
  static String routeName = "/jadwal_pelajaran_guru";
  @override
  _JadwalPelajaranGuru createState() => _JadwalPelajaranGuru();
}

class _JadwalPelajaranGuru extends State<JadwalPelajaranGuru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        // automaticallyImplyLeading: false,
        automaticallyImplyLeading: false,
        title: HeadersForMenu('Jadwal Mengajar'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: Body(),
    );
  }
}
