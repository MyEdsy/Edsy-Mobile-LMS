import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_quiz.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/components/component_mata_pelajaran.dart';

import 'component_mata_pelajaran.dart';

class WaliMuridSubmenuQuizSiswaBody extends StatefulWidget {
  const WaliMuridSubmenuQuizSiswaBody({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliMuridSubmenuQuizSiswaBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          SliderQuiz(),
          const SizedBox(
            height: 10,
          ),
          const WaliMuridComponentQuizSiswa()
        ],
      ),
    );
  }
}