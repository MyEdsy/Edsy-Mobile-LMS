import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../constants.dart';
import 'component_tugas.dart';
import '../tugas_screens.dart';
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
            'Tugas ${MenuTugas.dataMapelPerIndex['Namamapel']} ${MenuTugas.dataMapelPerIndex['KelompokKelas']} ${MenuTugas.dataMapelPerIndex['Jurusan']} ${MenuTugas.dataMapelPerIndex['NamaKelompokKelas']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ComponentTugas()
        // KategoriNilai()
      ],
    );
  }
}
