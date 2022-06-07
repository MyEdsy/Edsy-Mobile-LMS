import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/search_field.dart';

import 'component_soal.dart';

class BodySoalTugas extends StatefulWidget {
  const BodySoalTugas({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodySoalTugas> {
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
