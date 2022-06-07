import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_jadwal.dart';
import 'package:school_apps/screens/features/wali_murid/jadwal_pelajaran/components/component_jadwal_walimurid.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';


class BodyJadwalPelajaran extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyJadwalPelajaran> {
  var data = jsonDecode(dataUserLogin);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          SliderJadwal(),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Jadwal Pelajaran',
              overflow: TextOverflow.ellipsis,
              style: mTitleStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          WaliMuridKomponenJadwalPelajaranSiswa()
        ],
      ),
    );
  }
}