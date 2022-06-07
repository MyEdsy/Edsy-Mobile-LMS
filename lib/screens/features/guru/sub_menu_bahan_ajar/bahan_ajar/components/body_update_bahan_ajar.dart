import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/components/form_tambah_file.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/components/form_update_bahan_ajar.dart';
import '../../../../../../size_config.dart';

class BodyUpdateBahanajar extends StatelessWidget {

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
                FormUpdateBahanAjar(),
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
