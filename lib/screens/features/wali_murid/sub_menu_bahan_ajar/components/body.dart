import 'package:flutter/widgets.dart';
import 'package:school_apps/components/slider_wali_kelas.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/components/component_matapelajaran_bahanajar.dart';

class BodyBahanAjar extends StatefulWidget {
  const BodyBahanAjar({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyBahanAjar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          const SizedBox(
            height: 5,
          ),
          SliderWaliKelas(),
          const SizedBox(
            height: 10,
          ),
          const WaliMuridComponentBahanAjar()
        ],
      ),
    );
  }
}