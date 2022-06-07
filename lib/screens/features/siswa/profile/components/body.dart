import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/siswa/profile/detail_profile_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.pushNamed(context, DetailProfileSiswaScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.RIGHSLIDE,
                      headerAnimationLoop: true,
                      title: 'Peringatan',
                      desc: "Dalam pengembangan",
                      btnOkOnPress: () {},
                      btnOkIcon: Icons.cancel,
                      btnOkColor: kColorYellow)
                  .show();
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.RIGHSLIDE,
                      headerAnimationLoop: true,
                      title: 'Peringatan',
                      desc: "Dalam pengembangan",
                      btnOkOnPress: () {},
                      btnOkIcon: Icons.cancel,
                      btnOkColor: kColorYellow)
                  .show();
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.RIGHSLIDE,
                      headerAnimationLoop: true,
                      title: 'Peringatan',
                      desc: "Dalam pengembangan",
                      btnOkOnPress: () {},
                      btnOkIcon: Icons.cancel,
                      btnOkColor: kColorYellow)
                  .show();
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Yekin ingin keluar",
                btnOkOnPress: () async {
                  final pref = await SharedPreferences.getInstance();
                  await pref.clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Onboarding.routerName, (r) => false);
                },
                btnOkIcon: Icons.check,
                btnOkColor: kColorTealToSlow,
                btnCancelOnPress: () async {},
                btnCancelIcon: Icons.cancel,
                btnCancelColor: kColorRedSlow,
              ).show();
            },
          ),
        ],
      ),
    );
  }
}
