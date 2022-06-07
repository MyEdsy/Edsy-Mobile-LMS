import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_apps/screens/features/wali_murid/profil/components/profil_name.dart';

import '../../../../constants.dart';
import '../../../../main.dart';

class WaliMuridBiodata extends StatelessWidget {
  const WaliMuridBiodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = jsonDecode(dataUserLogin);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Text("NIS", style: mTitleStyle),
          WaliMuridProfileName(
            title: "NIS",
            text: '${data['nis'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("NISN", style: mTitleStyle),
          WaliMuridProfileName(
            title: "NISN",
            text: '${data['nisn'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("Nama Siswa", style: mTitleStyle),
          WaliMuridProfileName(
            title: "Nama Siswa",
            text: '${data['nama_siswa'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "Nama Wali",
            text: data['nama_ayah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "Alamat",
            text: data['alamat'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "Pekerjaan Ayah",
            text: data['kerja_ayah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "Pekerjaan Ibu",
            text: data['kerja_ibu'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "Email Wali",
            text: data['email'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          WaliMuridProfileName(
            title: "No.Telp Wali",
            text: data['no_telp_wali'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}