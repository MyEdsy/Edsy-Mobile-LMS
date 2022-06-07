import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/tugas_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';

class WaliMuridComponentTugasSiswa extends StatefulWidget {
  const WaliMuridComponentTugasSiswa({Key? key}) : super(key: key);

  @override
  _WaliMuridComponentTugasSiswa createState() => _WaliMuridComponentTugasSiswa();
}

class _WaliMuridComponentTugasSiswa extends State<WaliMuridComponentTugasSiswa> {
  var isLoading = false;
  var responseJson, dataMapel;
  var status, code;

  var data = jsonDecode(dataUserLogin);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 10, bottom: 12),
          child: Text(
            'Tugas',
            style: mTitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: mGreyColor,
                    highlightColor: mGreyColor,
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, __) => (dummyListViewCell()),
                        itemCount: 10,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1)),
                  ),
                )
              : ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    GridView.builder(
                      itemCount: dataMapel == null ? 0 : dataMapel.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return _buildCard(
                            dataMapel[index]['Namamapel'],
                            '${dataMapel[index]['hari']}',
                            dataMapel[index],
                            '${index}',
                            'assets/images/task-list.png',
                            false,
                            false,
                            context);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 1,
                      ),
                    ),
                    const SizedBox(height: 15.0)
                  ],
                ),
        )
      ],
    );
  }

  Widget _buildCard(String name, String kelas, data, String index,
      String imgPath, bool added, bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
        child: InkWell(
            onTap: () {
              print(index);
              Navigator.pushNamed(context, WaliMuridMenuTugasSiswa.routeName,
                  arguments: data);
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: index,
                          child: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        imgPath,
                                      ),
                                      fit: BoxFit.contain)))),
                      const SizedBox(height: 7.0),
                      Text(name,
                          style: const TextStyle(
                              color: Color(0xFF575E67),
                              // fontFamily: 'Varela',
                              fontSize: 14.0)),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                      Text(kelas,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              // fontFamily: 'Varela',
                              fontSize: 14.0)),
                    ]))));
  }

  Widget dummyListViewCell() {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
        child: InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => CookieDetail(
              //         assetPath: imgPath,
              //         cookieprice:price,
              //         cookiename: name
              //     )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45.0,
                        width: 45.0,
                      ),
                      const SizedBox(height: 7.0),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                    ]))));
  }

  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http.get(
          "${jadwalSiswaByNisn}${data['nisn']}/${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}",
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
          dataMapel = responseJson['result'];
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeWaliMurid.routeName, (r) => false);
                    // Navigator.pushNamed(
                    //     context, SignInScreen.routeName);
                  },
                  btnOkColor: kColorYellow)
              .show();
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeWaliMurid.routeName, (r) => false);
                },
                btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
