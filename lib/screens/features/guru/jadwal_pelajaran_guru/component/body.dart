import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_all.dart';
import 'package:school_apps/components/slider_jadwal.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../home_guru.dart';
import 'component_jadwal.dart';


class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {
  var data = jsonDecode(dataUserLogin);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          SliderJadwal(),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              'Jadwal Mengajar',
              overflow: TextOverflow.ellipsis,
              style: mTitleStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KomponenJadwalPelajaranGuru()
        ],
      ),
    );
  }
}