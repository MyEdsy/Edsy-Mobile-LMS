import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../main.dart';
import 'components/profile_name.dart';

class Biodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = jsonDecode(dataUserLogin);
    print('data = $data');
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Text("NIS", style: mTitleStyle),
          ProfileName(
            title: "NIP",
            text: '${data['Nip'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("NISN", style: mTitleStyle),
          ProfileName(
            title: "NIK",
            text: '${data['Nik'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("Nama Siswa", style: mTitleStyle),
          ProfileName(
            title: "Nama Lengkap",
            text: '${data['nama'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Jenis Kelamin",
            text: data['Jeniskelamin'] == 'L' ? 'Laki-laki' : 'Perempuan',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Tempat Lahir",
            text: data['Tempatlahir'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Agama",
            text: data['Agama'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Alamat",
            text: data['Alamat'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "No HP",
            text: data['NoHp'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Email",
            text: data['Email'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Jabatan",
            text: data['Jabatan'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Pangkat",
            text: data['Pangkat'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Golongan",
            text: data['Golongan'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "NUPTK",
            text: data['NUPTK'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Goldarah",
            text: data['Goldarah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Jabatan Sekolah",
            text: data['Jabatansekolah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Status Guru",
            text: data['status_guru'] == 'NULL' ? '-' : data['status_guru'],
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Sertifikasi",
            text: '${data['sertifikasi'] ?? ''}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),

        ],
      ),
    );
  }
}