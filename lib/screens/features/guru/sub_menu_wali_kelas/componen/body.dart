import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_menu_presensi.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/component_sub_menu_wali_kelas.dart';

import 'component_log_siswa.dart';

class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          SliderWaliKelas(),
          ComponentMenuWaliKelas(),
          LogSiswa()
        ],
      ),
    );
  }
}