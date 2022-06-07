import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/components/search.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/components/component_matapelajaran_bahanajar.dart';

import '../../../../../../constants.dart';
import '../bahan_ajar_screen.dart';

class BodyComponentBahanAjar extends StatefulWidget {
  const BodyComponentBahanAjar({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyComponentBahanAjar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: const <Widget>[
        // SearchField(),
        SizedBox(
          height: 12,
        ),
        WaliMuridComponentBahanAjar()
        // KategoriNilai()
      ],
    );
  }
}
