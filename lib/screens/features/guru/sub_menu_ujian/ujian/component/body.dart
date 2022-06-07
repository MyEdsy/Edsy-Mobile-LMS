import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/component/component_ujian.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';
import '../../../../../../constants.dart';
class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        // SearchFieldTugas(),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'Ujian ${MenuUjian.dataMapelPerIndex['Namamapel']} ${MenuUjian.dataMapelPerIndex['KelompokKelas']} ${MenuUjian.dataMapelPerIndex['Jurusan']} ${MenuUjian.dataMapelPerIndex['NamaKelompokKelas']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ComponentUjian()
        // KategoriNilai()
      ],
    );
  }
}
