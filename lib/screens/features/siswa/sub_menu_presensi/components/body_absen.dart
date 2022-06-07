import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/componen/searc_field_siswa.dart';

import '../../../../../constants.dart';
import '../absen_screen.dart';
import 'component_absen.dart';


class BodyLaporanAbsenSiswaMenuWaliKelas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyLaporanAbsenSiswaMenuWaliKelas> {

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
                      label: Text('${DetailAbsenSiswa.dataMapelFromRoutes['Namamapel']} - ${DetailAbsenSiswa.dataMapelFromRoutes['Nama']}', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold, color: Colors.white)),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(left: 16),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text("Dari : ", style: mTitleStyle,)
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(left: 4),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Chip(
          //             backgroundColor: kColorBlue,
          //             label: Text("01/10/2021", style: TextStyle(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.bold, color: Colors.white)),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(left: 4),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text("Sampai : ", style: mTitleStyle,)
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(left: 4),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Chip(
          //             backgroundColor: kColorBlue,
          //             label: Text("30/10/2021", style: TextStyle(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.bold, color: Colors.white)),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          LaporanAbsenSiswaAbsen()
          // MataPelajaranAbsen(),
        ],
      ),
    );
  }
}