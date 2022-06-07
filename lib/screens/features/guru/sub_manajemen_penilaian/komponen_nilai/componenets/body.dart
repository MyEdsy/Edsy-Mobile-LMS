import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/components/search_field.dart';

import 'component_komponen_nilai_pengetahuan.dart';
import 'component_mata_pelajaran_komponen_nilai.dart';

class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      // physics: ClampingScrollPhysics(),
      children: <Widget>[
        // SearchField(),
        SizedBox(
          height: 12,
        ),
        MataPelajaranKategoriNilai()
        // KategoriNilai()
      ],
    );
  }
}
