import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';

import 'component_menu_pembelajaran.dart';
import 'component_tugas.dart';


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
          SliderWaliKelas(),
          SizedBox(
            height: 12,
          ),
          // Service Section
          KomponenMenuPembelajaranSiswa(),
          SizedBox(
            height: 12,
          ),
          // TugasSiswa(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}