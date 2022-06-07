import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/components/komponen_mata_pelajaran_laporan_absen.dart';

import 'komponen_mata_pelajaran_absen.dart';


class BodyMataPelajaranUntukLaporanAbsen extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyMataPelajaranUntukLaporanAbsen> {

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
          MataPelajaranLaporanAbsen(),
        ],
      ),
    );
  }
}