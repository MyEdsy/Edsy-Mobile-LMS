import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/components_detail_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/component/components_detail_ujian.dart';

class BodyDetailUjian extends StatefulWidget {
  @override
  _BodyDetailUjian createState() => _BodyDetailUjian();
}

class _BodyDetailUjian extends State<BodyDetailUjian> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        ComponentDetailUjian()
        // KategoriNilai()
      ],
    );
  }
}
