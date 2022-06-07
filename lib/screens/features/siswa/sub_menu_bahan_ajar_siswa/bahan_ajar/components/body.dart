import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/components/search.dart';

import '../../../../../../constants.dart';
import '../bahan_ajar_screen.dart';
import 'components_bahan_ajar.dart';

class Body extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        // SearchField(),
        SizedBox(
          height: 12,
        ),
        ComponentBahanAjar()
        // KategoriNilai()
      ],
    );
  }
}
