import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/jawaban_quiz_screen.dart';
import '../../../../../../constants.dart';
import 'component_jawaban_quiz_siswa.dart';

class BodyJawabanQuizSiswa extends StatefulWidget {
  @override
  _BodyJawabanSiswa createState() => _BodyJawabanSiswa();
}

class _BodyJawabanSiswa extends State<BodyJawabanQuizSiswa> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SOAL :",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Text(
                JawabanQuizSiswaDiGuru.dataSoal['soal'] ?? '-',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kPrimaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              JawabanQuizSiswaDiGuru.dataSoal['type'] == 'PG'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jawaban Benar :",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        Text(
                          JawabanQuizSiswaDiGuru.dataSoal['jawaban_benar'] ?? '-',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        komponentJawabanQuiz()
      ],
    );
  }
}
