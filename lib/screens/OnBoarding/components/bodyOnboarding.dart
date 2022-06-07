import 'package:flutter/material.dart';
import 'package:school_apps/components/default_button.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  var responseJson, dataTahunAjaran;

  _getDataUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dataBaseUrl = sharedPreferences.getString("dataBaseUrl");
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getDataUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataUser = ModalRoute.of(context)!.settings.arguments as Map;
    print(dataBaseUrl);
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success_.png",
          // height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Berhasil, Tekan Lanjutkan Untuk Masuk",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Lanjutkan",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
              // if (dataUser['nama_akses'] == 'Guru') {
              //   Navigator.pushNamed(context, HomeGuru.routeName);
              // } else {
              //   Navigator.pushNamed(context, HomeSiswa.routeName);
              // }
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
