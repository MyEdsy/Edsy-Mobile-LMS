import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/components/search_field.dart';

import 'component_soal.dart';

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
        // SearchFieldSoal(),
        // SizedBox(
        //   height: 12,
        // ),
        komponentSoal(),
      ],
    );
  }
}
