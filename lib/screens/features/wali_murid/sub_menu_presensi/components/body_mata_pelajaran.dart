import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/components/component_mata_pelajaran.dart';

class WaliMuridBodyMataPelajaranAbsen extends StatefulWidget {
  const WaliMuridBodyMataPelajaranAbsen({Key? key}) : super(key: key);

  @override
  _WaliMuridBodyMataPelajaranAbsen createState() => _WaliMuridBodyMataPelajaranAbsen();
}

class _WaliMuridBodyMataPelajaranAbsen extends State<WaliMuridBodyMataPelajaranAbsen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          // SearchField(),
          const SizedBox(
            height: 5,
          ),
          WaliMuridMataPelajaranAbsen(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}