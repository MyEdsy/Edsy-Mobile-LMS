import 'package:flutter/material.dart';
import '../../../../../../size_config.dart';
import 'form_input_soal_ujian.dart';

class BodyInputSoalUjian extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
        FormInputSoalUjian(),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
