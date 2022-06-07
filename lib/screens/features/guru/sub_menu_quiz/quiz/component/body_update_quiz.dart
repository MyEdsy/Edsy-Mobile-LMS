import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/form_update_quiz.dart';
import '../../../../../../size_config.dart';

class BodyUpdateQuiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
        FormUpdatequiz(),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
