import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_menu_presensi.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'component_sub_menu_presensi_kelas.dart';
import 'components_total_absen_per_mat_pel.dart';


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
          SliderPresensiKelas(),
          MenuPresensiKelas(),
          // TotalAbsenPerMatPel()
        ],
      ),
    );
  }
}