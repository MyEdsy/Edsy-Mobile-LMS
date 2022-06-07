import 'dart:convert';

import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/data_menu_pelanggaran/menu_pelanggaran.dart';

import '../../../../../components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import '../menu_kesiswaan_screen.dart';

class WaliMuridDetailPelanggaran extends StatefulWidget {
  static String routeName = '/walimurid_detailpelanggaran';
  static var dataPelanggaran;

  const WaliMuridDetailPelanggaran({Key? key}) : super(key: key);

  @override
  State<WaliMuridDetailPelanggaran> createState() => _WaliMuridDetailPelanggaranState();
}

class _WaliMuridDetailPelanggaranState extends State<WaliMuridDetailPelanggaran> {
  @override
  Widget build(BuildContext context) {
    WaliMuridDetailPelanggaran.dataPelanggaran = ModalRoute.of(context)!.settings.arguments;
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.blueGrey,
          onPressed: () {
            _onBackPressed();
          },
        ),
        // automaticallyImplyLeading: false,
        title: HeadersForMenu('Detail Pelanggaran'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: const MyStatefulWidget(),
    ), onWillPop: _onBackPressed);
  }
  Future<bool> _onBackPressed() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: const WaliMuridMenuPelanggaran(),
      ),
    );
    return Future.value(true);
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(1.0),
          child:  Text(
            WaliMuridDetailPelanggaran.dataPelanggaran['nisn'],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1.0),
          child:  Text(
            WaliMuridDetailPelanggaran.dataPelanggaran['nama_siswa'],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            'Detail :',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.edit_calendar_sharp,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['kasus'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.date_range_rounded,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['tgl_kejadian'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['tempat_kejadian'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.people_alt_rounded,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['saksi'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.sync_problem_rounded,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['sanksi'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.equalizer_rounded,
                color: Colors.blueGrey,
                size: 34.0,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                WaliMuridDetailPelanggaran.dataPelanggaran['jenis_sanksi'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            'Foto Bukti :',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Image.network(
            WaliMuridDetailPelanggaran.dataPelanggaran['img_kasus'],
            height: 200,
            width: 100,
          ),
        ),
      ],
    );
  }
}