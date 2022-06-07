import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/components/no_account_text.dart';
import 'package:school_apps/screens/login/components/login_form.dart';
import 'package:school_apps/server/api.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  var isLoading = false;
  var responseJson, dataSekolah;
  var status, code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      SimpleShadow(
                        child: ClipOval(
                          child: Image.network(
                            '${logoSekolah}${dataSekolah['logo']}',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              // Appropriate logging or analytics, e.g.
                              // myAnalytics.recordError(
                              //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                              //   exception,
                              //   stackTrace,
                              // );
                              return Image.asset(
                                'assets/images/logo_edsy_new.jpeg',
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        opacity: 0.5, // Default: 0.5
                        color: kSecondaryColor, // Default: Black
                        offset: Offset(5, 5), // Default: Offset(2, 2)
                        sigma: 2, // Default: 2
                      ),
                      // Image(image: AssetImage('graphics/background.png')),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      //
                      Text('${dataSekolah['nama_sekolah']}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: mTitleStyleNameApps),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      SignForm(),
                      // SizedBox(height: SizeConfig.screenHeight * 0.08),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      const NoAccountText(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };

    try {
      final response = await http.get("${dataSekolahAPI}", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataSekolah = responseJson['result'];
        } else if (status == false && code == 403) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['message'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.check,
                  onDissmissCallback: (type) {
                    //SignInScreen
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, HomeGuru.routeName, (r) => false);
                    // Navigator.pushNamed(
                    //     context, SignInScreen.routeName);
                  },
                  btnOkColor: kColorYellow)
              .show();
        } else {
          setState(() {
            isLoading = false;
          });
          // AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.ERROR,
          //     animType: AnimType.RIGHSLIDE,
          //     headerAnimationLoop: true,
          //     title: 'Peringatan',
          //     desc: "Sesi anda telah habis, mohon login kembali",
          //     btnOkOnPress: () {},
          //     btnOkIcon: Icons.cancel,
          //     onDissmissCallback: (type) async {
          //       //SignInScreen
          //       // Navigator.pushNamedAndRemoveUntil(
          //       //     context, SignInScreen.routeName, (r) => false);
          //       final pref = await SharedPreferences.getInstance();
          //       await pref.clear();
          //     },
          //     btnOkColor: kColorRedSlow)
          //     .show();
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      // setState(() {
      //   isLoading = false;
      //   AwesomeDialog(
      //       context: context,
      //       dialogType: DialogType.ERROR,
      //       animType: AnimType.RIGHSLIDE,
      //       headerAnimationLoop: true,
      //       title: 'Peringatan',
      //       desc: "Tidak dapat terhububg ke server",
      //       btnOkOnPress: () {},
      //       btnOkIcon: Icons.cancel,
      //       onDissmissCallback: (type) async {
      //         //SignInScreen
      //         Navigator.pushNamedAndRemoveUntil(
      //             context, HomeGuru.routeName, (r) => false);
      //       },
      //       btnOkColor: kColorRedSlow)
      //       .show();
      // });
    }

    return 'success';
  }
}
