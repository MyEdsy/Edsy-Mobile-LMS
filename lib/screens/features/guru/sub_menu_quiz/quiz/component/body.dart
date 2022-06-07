import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../constants.dart';
import '../quiz_screens_.dart';
import 'component_tugas.dart';

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
            'Quiz / Ujian ${MenuQuiz.dataMapelPerIndex['Namamapel']} ${MenuQuiz.dataMapelPerIndex['KelompokKelas']} ${MenuQuiz.dataMapelPerIndex['Jurusan']} ${MenuQuiz.dataMapelPerIndex['NamaKelompokKelas']}',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: mTitleStyleNameApps,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ComponentQuiz()
        // KategoriNilai()
      ],
    );
  }
}
