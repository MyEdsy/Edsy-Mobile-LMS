import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/components/form_update_soal_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/form_input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/form_update_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/components/form_update_soal_ujian.dart';

import '../../../../../../size_config.dart';

class BodyUpdateSoalUjian extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
        FormUpdateSoalUjian(),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
