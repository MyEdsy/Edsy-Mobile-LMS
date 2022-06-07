import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_all.dart';
import 'package:school_apps/screens/features/guru/home/components/pengumuman.dart';
import 'package:school_apps/screens/login/response/response_users.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../home_guru.dart';
import 'component_kelas_hari_ini.dart';
import 'component_menu_guru.dart';
import 'component_tugas.dart';


class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {
  var data = jsonDecode(dataUserLogin);
  @override
  Widget build(BuildContext context) {
    final dataUser = ModalRoute.of(context)!.settings.arguments as Map;
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Hi, ${data['Jeniskelamin'] == 'L' ? 'Pak' : 'Bu'} ${data['nama']} 👋\nSelamat datang di EDSY!',
              overflow: TextOverflow.ellipsis,
              style: mTitleStyle,
            ),
          ),
          SliderAll(),
          SizedBox(
            height: 12,
          ),
          // Service Section
          MenuGuru(),
          Pengumuman(),
          // Popular Destination Section
          KelasHariIni(),
          SizedBox(
            height: 12,
          ),
          // Tugas(),
          // SizedBox(
          //   height: 12,
          // ),
        ],
      ),
    );
  }
}