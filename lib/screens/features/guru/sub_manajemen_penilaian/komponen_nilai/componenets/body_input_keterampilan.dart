import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/componenets/form_input_komponen_nilai_keterampilan.dart';

import '../../../../../../constants.dart';
import '../../../../../../size_config.dart';
import 'form_input_komponen_nilai.dart';

class BodyInputKategoriNilaiKeterampilan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
                InputKategoriNilaiKeterampilanForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
