import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'onboarding_form.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                // SimpleShadow(
                //   child:
                //   opacity: 0.5, // Default: 0.5
                //   color: kSecondaryColor, // Default: Black
                //   offset: Offset(0, 5), // Default: Offset(2, 2)
                //   sigma: 2, // Default: 2
                // ),
                ClipOval(
                    child: Image.asset(
                  'assets/images/logo_edsy_new.jpeg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                )),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text('Masukan Kode Sekolah Anda',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: mTitleStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                OnBoardingForm(),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
