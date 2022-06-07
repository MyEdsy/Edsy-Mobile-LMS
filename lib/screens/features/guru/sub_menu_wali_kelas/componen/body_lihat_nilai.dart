import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/component_lihat_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/searc_field_siswa.dart';

class BodyLihatNilai extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyLihatNilai> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SearchFieldSiswa(),
          SizedBox(
            height: 5,
          ),
          WaliKelasLihatNilai()
        ],
      ),
    );
  }
}