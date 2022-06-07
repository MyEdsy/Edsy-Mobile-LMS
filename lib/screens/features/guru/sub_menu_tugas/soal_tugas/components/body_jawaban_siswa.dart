import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../../../constants.dart';
import '../jawaban_screen.dart';
import 'component_jawaban_siswa.dart';

class BodyJawabanSiswa extends StatefulWidget {
  @override
  _BodyJawabanSiswa createState() => _BodyJawabanSiswa();
}

class _BodyJawabanSiswa extends State<BodyJawabanSiswa> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "SOAL :",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Text(
                JawabanSiswaDiGuru.dataSoal['soal'] ?? '-',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: kPrimaryColor),
              ),
              // Html(data: soal),
              const SizedBox(
                height: 10,
              ),
              JawabanSiswaDiGuru.dataSoal['type'] == 'PG'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jawaban Yang Benar : ${JawabanSiswaDiGuru.dataSoal['jawaban_benar'] ?? '-'}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ],
                    )
                  : Container(
                    padding: const EdgeInsets.all(1.0),
                  )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        komponentJawaban()
      ],
    );
  }
}
