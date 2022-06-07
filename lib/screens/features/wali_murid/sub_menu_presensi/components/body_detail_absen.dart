import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/components/search_field.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/components/component_detail_absen.dart';

class WaliMuridBodyDetailAbsenPersiswa extends StatefulWidget {
  const WaliMuridBodyDetailAbsenPersiswa({Key? key}) : super(key: key);

  @override
  _WaliMuridBodyDetailAbsenPersiswa createState() => _WaliMuridBodyDetailAbsenPersiswa();
}

class _WaliMuridBodyDetailAbsenPersiswa extends State<WaliMuridBodyDetailAbsenPersiswa> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          // SearchField(),
          // SizedBox(
          //   height: 5,
          // ),
          WaliMuridComponenDetailAbsenSiswa(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}