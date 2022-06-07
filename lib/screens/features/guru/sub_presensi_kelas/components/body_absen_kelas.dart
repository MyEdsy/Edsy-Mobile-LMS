import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/search_field_siswa.dart';

import 'components_absensi_kelas.dart';
import 'komponen_mata_pelajaran_absen.dart';


class BodyAbsenKelas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyAbsenKelas> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          // SearchFieldSiswa(),
          SizedBox(
            height: 5,
          ),
          AbsnseiKelasComponent()
        ],
      ),
    );
  }
}