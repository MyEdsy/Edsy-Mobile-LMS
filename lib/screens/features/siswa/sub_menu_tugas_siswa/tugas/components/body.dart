import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../constants.dart';
import '../../tugas_scareens.dart';
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
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        // SearchFieldTugas(),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'Tugas ${MenuTugasSiswa.dataMapelPerIndex['Namamapel']} ${MenuTugasSiswa.dataMapelPerIndex['kode_kelompok']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ComponentTugas()
        // KategoriNilai()
      ],
    );
  }
}
