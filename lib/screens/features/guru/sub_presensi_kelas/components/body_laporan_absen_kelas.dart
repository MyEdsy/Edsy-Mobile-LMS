import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/laporan_absen_kelas_screen.dart';

import '../../../../../constants.dart';
import 'component_laporan_absen_siswa.dart';
import 'search_field_siswa.dart';


class BodyLaporanAbsenSiswa extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyLaporanAbsenSiswa> {

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
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pelajaran : ", style: mTitleStyle,)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      backgroundColor: kColorTeal,
                      label: Text('${LaporanAbsenKelasScreen.dataMapelFromRoutes['Namamapel']} - ${LaporanAbsenKelasScreen.dataMapelFromRoutes['KelompokKelas']} ${LaporanAbsenKelasScreen.dataMapelFromRoutes['Jurusan']} ${LaporanAbsenKelasScreen.dataMapelFromRoutes['NamaKelompokKelas']}', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold, color: Colors.white)),
                    )
                  ],
                ),
              ),
            ],
          ),
          LaporanAbsenSiswa()
          // MataPelajaranAbsen(),
        ],
      ),
    );
  }
}