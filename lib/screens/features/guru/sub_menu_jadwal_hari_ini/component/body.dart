import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_menu_presensi.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';

import 'component_jadwal_pelajaran.dart';


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
          // SearchField(),
          SizedBox(
            height: 5,
          ),
          JadwalPelajaran()
        ],
      ),
    );
  }
}