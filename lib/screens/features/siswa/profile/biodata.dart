import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../main.dart';
import 'components/profile_name.dart';

class Biodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = jsonDecode(dataUserLogin);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Text("NIS", style: mTitleStyle),
          ProfileName(
            title: "NIS",
            text: '${data['nis'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("NISN", style: mTitleStyle),
          ProfileName(
            title: "NISN",
            text: '${data['nisn'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // Text("Nama Siswa", style: mTitleStyle),
          ProfileName(
            title: "Nama Siswa",
            text: '${data['nama_siswa'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Jenis Kelamin",
            text: data['jenkel'] == 'l' ? 'Laki-laki' : 'Perempuan',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Tempat Lahir",
            text: data['tempat_lahir'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Tanggal Lahir",
            text: data['tgl_lahir'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Agama",
            text: data['agama'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Nama Ayah",
            text: data['nama_ayah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Nama Ibu",
            text: data['nama_ibu'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Alamat",
            text: data['alamat'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Pekerjaan Ayah",
            text: data['kerja_ayah'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Pekerjaan Ibu",
            text: data['kerja_ibu'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Email Wali",
            text: data['email_wali'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Email Siswa",
            text: data['email_siswa'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "No.Telp Wali",
            text: data['no_telp_wali'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "No.Telp Siswa",
            text: data['no_telp'] ?? '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          Text("#DATA IJAZAH", style: mTitleStyle),
          ProfileName(
            title: "Tahun Ijazah",
            text: '${data['ijazah_tahun'] ?? '-'}',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Nopes UN SMP",
            text: '${data['ijazah_nopes']}' != 'null' ? '${data['ijazah_nopes']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "NO. SHUN",
            text: '${data['ijazah_no_shun']}' != 'null' ? '${data['ijazah_no_shun']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "NO. Ijazah",
            text: '${data['ijazah_no']}' != 'null' ? '${data['ijazah_no']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          Text("#DATA ASAL SEKOLAH", style: mTitleStyle),
          ProfileName(
            title: "Asal Sekolah",
            text: '${data['asal_sekolah']}' != 'null' ? '${data['asal_sekolah']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Tanggal Masuk",
            text: '${data['tgl_masuk']}' != 'null' ? '${data['tgl_masuk']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileName(
            title: "Tanggal Keluar",
            text: '${data['tgl_keluar']}' != 'null' ? '${data['tgl_keluar']}': '-',
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}