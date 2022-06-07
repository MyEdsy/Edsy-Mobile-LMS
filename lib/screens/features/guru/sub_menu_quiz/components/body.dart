import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_quiz.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/components/component_mata_pelajaran.dart';

class SubmenuQuizBody extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SubmenuQuizBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          SliderQuiz(),
          SizedBox(
            height: 10,
          ),
          ComponentQuiz()
        ],
      ),
    );
  }
}