import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/components/card_pelanggaran.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/data_pelanggaran/detailpelanggaran.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/kesiswaan_screen.dart';
import 'package:school_apps/server/api.dart';
import 'dart:convert';

import '../../../../../components/headers_for_sub_menu.dart';
import '../../../../../constants.dart';
import '../../../../../main.dart';

class MenuPelanggaran extends StatefulWidget {
  static String routeName = '/menu_pelanggaran';

  const MenuPelanggaran({Key? key}) : super(key: key);

  @override
  State<MenuPelanggaran> createState() => _MenuPelanggaran();
}

class _MenuPelanggaran extends State<MenuPelanggaran> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
            title: HeadersForMenu('Daftar Pelanggaran'),
            elevation: 0,
          ),
          backgroundColor: mBackgroundColor,
          body: const MyStatefulWidget(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: KesiswaanScreen(),
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
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataPelanggaranSiswa = [];
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const SizedBox(height: 10.0),
        // Container(
        //   padding: const EdgeInsets.all(10.0),
        //   child: const Text(
        //     'Menu Pelanggaran',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 30,
        //       color: Colors.black87,
        //     ),
        //   ),
        // ),
        // const Divider(
        //   height: 10,
        //   color: Colors.black87,
        // ),
        // nanti disini
        ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:
                dataPelanggaranSiswa == null ? 0 : dataPelanggaranSiswa.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              // return _listDataPelanggaran(
              //     dataPelanggaranSiswa[index]['kasus'], dataPelanggaranSiswa[index]);
              return CardPelanggaran(
                  text: dataPelanggaranSiswa[index]['kasus'],
                  icon: "assets/icons/order.svg",
                  press: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                      DetailPelanggaran.routeName,
                      arguments: {
                        'nisn': dataPelanggaranSiswa[index]['nisn'],
                        'nama_siswa': dataPelanggaranSiswa[index]['nama_siswa'],
                        'jenis_sanksi': dataPelanggaranSiswa[index]
                            ['jenis_sanksi'],
                        'kasus': dataPelanggaranSiswa[index]['kasus'],
                        'tgl_kejadian': dataPelanggaranSiswa[index]
                            ['tgl_kejadian'],
                        'tempat_kejadian': dataPelanggaranSiswa[index]
                            ['tempat_kejadian'],
                        'saksi': dataPelanggaranSiswa[index]['saksi'],
                        'sanksi': dataPelanggaranSiswa[index]['sanksi'],
                        'img_kasus': dataPelanggaranSiswa[index]['img_kasus'],
                      },
                    );
                  });
            }),
        const SizedBox(height: 10)
      ],
    );
  }

  _listDataPelanggaran(namaPelanggaran, index) {
    return Container(
      width: 520,
      height: 80,
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            side: const BorderSide(width: 2, color: Colors.white54),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.all(20)),
        onPressed: () {
          // Navigator.pushNamed(
          //   context,
          //   'detailpelanggaran',

          // );
          Navigator.of(context, rootNavigator: true).pushNamed(
            DetailPelanggaran.routeName,
            arguments: {
              'nisn': index['nisn'],
              'nama_siswa': index['nama_siswa'],
              'jenis_sanksi': index['jenis_sanksi'],
              'kasus': index['kasus'],
              'tgl_kejadian': index['tgl_kejadian'],
              'tempat_kejadian': index['tempat_kejadian'],
              'saksi': index['saksi'],
              'sanksi': index['sanksi'],
              'img_kasus': index['img_kasus'],
            },
          );
        },
        icon: const Icon(Icons.double_arrow),
        label: Text(
          namaPelanggaran,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.5),
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
      'x-access-token': data['access_token'],
      'username': data['username'],
    };

    try {
      final response = await http.get("${urlPelanggaran}${data['nisn']}", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataPelanggaranSiswa = List<Map<String, dynamic>>.from(
              json.decode(response.body)['result']);
          // print(dataTagihanSiswa);
        } else if (status == false && code == 403) {
          dataPelanggaranSiswa = [];
        } else {}
      });
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          status = false;
          isLoading = false;
        });
      }
    }

    return 'success';
  }
}
