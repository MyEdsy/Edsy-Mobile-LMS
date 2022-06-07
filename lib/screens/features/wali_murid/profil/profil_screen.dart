import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/wali_murid/profil/components/body.dart';

class ProfileWaliMuridScreen extends StatelessWidget {
  static String routeName = "/profile_walimurid";

  const ProfileWaliMuridScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProfil(),
    );
  }
}
