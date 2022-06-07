import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/walimurid_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../constants.dart';
import '../../../../../main.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/server/api.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/response/responseAbsen.dart';

import '../../../../OnBoarding/OnBoarding.dart';
import '../absen_screen.dart';


class WaliMuridComponenDetailAbsenSiswa extends StatefulWidget {
  @override
  _WaliMuridComponenDetailAbsenSiswa createState() => _WaliMuridComponenDetailAbsenSiswa();
}

class _WaliMuridComponenDetailAbsenSiswa extends State<WaliMuridComponenDetailAbsenSiswa> {
  var isLoading = false;
  var responseJson, dataDetailAbsenSiswa;
  var code;
  late bool status;

  var dataUser = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: mGreyColor,
        child: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, __) => (dummyListViewCell()),
          itemCount: 10,
        ),
      ),
    )
        : ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: dataDetailAbsenSiswa == null
                ? 0
                : dataDetailAbsenSiswa.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return _listKehadiran(dataDetailAbsenSiswa[index]['status'],
                  parseDateIndoFullNameMount(dataDetailAbsenSiswa[index]['jam_absen']));
            }),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget dummyListViewCell() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 48.0,
            height: 48.0,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 40.0,
                  height: 8.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _listKehadiran(String status, String tanggal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          padding: const EdgeInsets.all(15),
          height: 97,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _chipStatus(status),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(1.0),
                        width: MediaQuery.of(context).size.width - 160,
                        child: Text(
                          tanggal,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _chipStatus(status) {
    if (status == 'Hadir') {
      return Chip(
        backgroundColor: kColorTealSlow,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (status == 'Sakit') {
      return Chip(
        backgroundColor: kColorBlue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (status == 'Izin') {
      return Chip(
        backgroundColor: kColorYellow,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (status == 'Alpha') {
      return Chip(
        backgroundColor: kColorRedSlow,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else if (status == 'Dispensasi') {
      return Chip(
        backgroundColor: Colors.deepPurpleAccent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': dataUser['access_token'],
      'username': dataUser['username']
    };

    try {
      final response = await http.get(
          "${getPrensiSiswaByIdSetJadwalNisn}/${WaliMuridDetailAbsenSiswa.dataMapelFromRoutes['idsetjadwal']}/${dataUser['nisn']}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataDetailAbsenSiswa = responseJson['result'];
          print(dataDetailAbsenSiswa);
        } else if (status == false && code == 403) {
          // totalKelas = responseJson['total'];
        } else {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: "Sesi anda telah habis, mohon login kembali",
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              onDissmissCallback: (type) async {
                //SignInScreen
                Navigator.pushNamedAndRemoveUntil(
                    context, Onboarding.routerName, (r) => false);
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
              },
              btnOkColor: kColorRedSlow)
              .show();
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          status = false;
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
                Navigator.pushNamedAndRemoveUntil(
                    context, WaliMuridScreen.routeName, (r) => false);
              },
              btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }
}
