import 'package:flutter/widgets.dart';
import '../../../../../../../size_config.dart';
import 'component_form_edit_nilai.dart';


class BodyEditNilai extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyEditNilai> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
                EditNilaiForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}