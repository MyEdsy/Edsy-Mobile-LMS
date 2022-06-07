import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/wali_murid/menu_pembelajaran/components/component_menu_pembelajaran.dart';


class BodyMenuPembelajaran extends StatefulWidget {
  const BodyMenuPembelajaran({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyMenuPembelajaran> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          SliderWaliKelas(),
          const SizedBox(
            height: 12,
          ),
          // Service Section
          const WaliMuridKomponenMenuPembelajaranSiswa(),
          const SizedBox(
            height: 12,
          ),
          // TugasSiswa(),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}