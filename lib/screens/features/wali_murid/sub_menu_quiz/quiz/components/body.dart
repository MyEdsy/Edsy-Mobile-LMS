import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/components/component_tugas.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/quiz_screen.dart';
import '../../../../../../constants.dart';

class WaliMuridBodyQuiz extends StatefulWidget {
  const WaliMuridBodyQuiz({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliMuridBodyQuiz> {
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
            'Quiz ${WaliMuridMenuQuizSiswa.dataMapelPerIndex['Namamapel']} ${WaliMuridMenuQuizSiswa.dataMapelPerIndex['kode_kelompok']}',
            overflow: TextOverflow.ellipsis,
            style: mTitleStyleNameApps,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const WaliMuridComponentQuizSiswa()
        // KategoriNilai()
      ],
    );
  }
}
