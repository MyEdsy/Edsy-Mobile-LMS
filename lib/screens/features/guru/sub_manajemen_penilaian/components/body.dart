import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_management_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/components/component_kategori_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/components/component_sub_menu_manajement_nilai.dart';

import '../../../../../../constants.dart';


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
          SliderManagementNilai(),
          MenuManajemenNilai(),
          SizedBox(
            height: 10,
          ),
          // KategoriNilai()
        ],
      ),
    );
  }
}