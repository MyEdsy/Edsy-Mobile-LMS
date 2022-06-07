import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_apps/server/api.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:http/http.dart' as http;
import '../../../../../constants.dart';
import '../../../../../main.dart';

class ProfilePic extends StatefulWidget{
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePic createState() => _ProfilePic();
}

class _ProfilePic extends State<ProfilePic> {

  var isLoading = false;
  var responseJson, dataUser;
  var status, code;
  var dataLogin = jsonDecode(dataUserLogin);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // var data = jsonDecode(dataUserLogin);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          // CircleAvatar(
          //   // backgroundImage: AssetImage("assets/images/Profile Image.png"),
          //   backgroundImage: NetworkImage(
          //       "${profileGuru}${data['paspoto']}"),
          // ),
          isLoading ?
              Center(
                child: CircularProgressIndicator(),
              ) : SimpleShadow(
            child: ClipOval(
              child: Image.network(
                "${profileGuru}${dataUser['paspoto']}",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  // Appropriate logging or analytics, e.g.
                  // myAnalytics.recordError(
                  //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                  //   exception,
                  //   stackTrace,
                  // );
                  return Image.asset(
                    'assets/images/not_found_users.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            opacity: 0.1, // Default: 0.5
            color: kSecondaryColor, // Default: Black
            offset: Offset(5, 5), // Default: Offset(2, 2)
            sigma: 7,
          ),
          // Positioned(
          //   right: -16,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 46,
          //     width: 46,
          //     child: TextButton(
          //       style: TextButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(50),
          //           side: BorderSide(color: Colors.white),
          //         ),
          //         primary: Colors.white,
          //         backgroundColor: Color(0xFFF5F6F9),
          //       ),
          //       onPressed: () {},
          //       child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
          //     ),
          //   ),
          // )
        ],
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
    print("${profile}/${dataLogin['username']}");
    try {
      final response = await http.get(
          "${profile}${dataLogin['username']}",
          headers: headers);
      responseJson = json.decode(response.body);
      // Future.delayed(Duration(seconds: 2)).then((value) {
      //   utilsApps.hideDialog(context);
      // });
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataUser = responseJson['result'];
        } else if (status == false && code == 403) {
          // AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.WARNING,
          //     animType: AnimType.RIGHSLIDE,
          //     headerAnimationLoop: true,
          //     title: 'Peringatan',
          //     desc: responseJson['message'],
          //     btnOkOnPress: () {},
          //     btnOkIcon: Icons.check,
          //     onDissmissCallback: (type) {
          //       //SignInScreen
          //       Navigator.pushNamedAndRemoveUntil(
          //           context, HomeGuru.routeName, (r) => false);
          //       // Navigator.pushNamed(
          //       //     context, SignInScreen.routeName);
          //     },
          //     btnOkColor: kColorYellow)
          //     .show();
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
          //       Navigator.pushNamedAndRemoveUntil(
          //           context, SignInScreen.routeName, (r) => false);
          //       final pref = await SharedPreferences.getInstance();
          //       await pref.clear();
          //     },
          //     btnOkColor: kColorRedSlow)
          //     .show();
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: "Tidak dapat terhububg ke server",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            onDissmissCallback: (type) async {
              //SignInScreen
              // Navigator.pushNamedAndRemoveUntil(
              //     context, HomeGuru.routeName, (r) => false);
            },
            btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
