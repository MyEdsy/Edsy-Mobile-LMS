import 'package:flutter/material.dart';
import 'package:school_apps/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  State createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _getDataUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_edsy.png',
              fit: BoxFit.contain,
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('EDSY', style: mTitleStyleNameApps))
          ],
        ),
      ),
      body: Body(),
    );
  }

  _getDataUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dataBaseUrl = sharedPreferences.getString("dataBaseUrl");
  }
}
