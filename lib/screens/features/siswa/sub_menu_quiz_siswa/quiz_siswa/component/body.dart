import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../constants.dart';
import '../quiz_screens_.dart';
import 'component_tugas.dart';

class BodyQuiz extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyQuiz> {
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
            'Quiz ${MenuQuizSiswa.dataMapelPerIndex['Namamapel']} ${MenuQuizSiswa.dataMapelPerIndex['kode_kelompok']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ComponentQuizSiswa()
        // KategoriNilai()
      ],
    );
  }
}
