import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/components/component_tugas.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/tugas_screen.dart';
import '../../../../../../constants.dart';
class BodyTugas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyTugas> {
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
            'Tugas ${WaliMuridMenuTugasSiswa.dataMapelPerIndex['Namamapel']} ${WaliMuridMenuTugasSiswa.dataMapelPerIndex['kode_kelompok']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const WaliMuridComponentTugas()
        // KategoriNilai()
      ],
    );
  }
}
