import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/components/form_update_tugas.dart';

import '../../../../../../size_config.dart';

class BodyUpdateTugas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
        FormUpdateTugas(),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
