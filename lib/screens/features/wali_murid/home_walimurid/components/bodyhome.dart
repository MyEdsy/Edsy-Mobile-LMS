import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_all.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/components/component_menu_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/components/component_pengumuman.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import 'component_kelas_hari_ini.dart';

class BodyHomeWaliMurid extends StatefulWidget {
  const BodyHomeWaliMurid({Key? key}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<BodyHomeWaliMurid > {
  var data = jsonDecode(dataUserLogin);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Hi, Wali Murid Dari ${data['nama_siswa']} 👋\nSelamat datang di EDSY!',
              style: mTitleStyle,
            ),
          ),
          SliderAll(),
          const SizedBox(
            height: 12,
          ),
          // Service Section
          MenuWaliMurid(),
          const ComponentPengumumanSiswa(),
          const SizedBox(
            height: 12,
          ),
          // Popular Destination Section
          WaliMuridKelasHariIni(),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
