import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/search_field.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/soal_quiz/components/component_soal.dart';

class BodySoalQuiz extends StatefulWidget {
  const BodySoalQuiz({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodySoalQuiz> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      // physics: ClampingScrollPhysics(),
      children: const <Widget>[
        // SearchFieldSoal(),
        // SizedBox(
        //   height: 12,
        // ),
        WaliMuridkomponentSoal(),
      ],
    );
  }
}
