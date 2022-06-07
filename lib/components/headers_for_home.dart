import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:school_apps/model/carousel_model.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/server/api.dart';

import '../../../../constants.dart';

class HeadersForHome extends StatefulWidget {
  final String menu;
  HeadersForHome(this.menu, {Key? key}): super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<HeadersForHome> {
  var isLoading = false;
  var responseJson, dataSekolah;
  var status, code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo_edsy.png',
          fit: BoxFit.contain,
          height: 30,
        ),
        isLoading ? CircularProgressIndicator() : Image.network(
          "${logoSekolah}${dataSekolah['logo']}",
          width: 40,
          height: 40,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context,
              Object exception, StackTrace? stackTrace) {
            // Appropriate logging or analytics, e.g.
            // myAnalytics.recordError(
            //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
            //   exception,
            //   stackTrace,
            // );
            return Container();
          },
        ),
        // Image.network(
        //     '${logoSekolah}${dataSekolah['logo']}',
        //     height: 40,
        //     width: 40,
        //     fit: BoxFit.cover),
        SizedBox(
          width: 10,
        ),
        Text("", style: mTitleStyleNameApps),
      ],
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
      // Future.delayed(Duration(seconds: 2)).then((value) {
      //   utilsApps.hideDialog(context);
      // });
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataSekolah = responseJson['result'];
          print(dataSekolah);
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