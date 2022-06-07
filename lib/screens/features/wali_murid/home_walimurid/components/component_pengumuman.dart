import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../pengumuman.dart';

class ComponentPengumumanSiswa extends StatefulWidget {
  const ComponentPengumumanSiswa({Key? key}) : super(key: key);

  @override
  _Pengumuman createState() => _Pengumuman();
}

class _Pengumuman extends State<ComponentPengumumanSiswa> {
  var isLoading = false, isLoadingAll = false;
  var responseJson, responseJsonAll, dataPenumuman, dataPenumumanAll;
  var code;
  late bool status;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container()
        : dataPenumuman.length > 0
            ? Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Pengumuman 📢",
                                style: mTitleStyle,
                                children: const [
                                  TextSpan(
                                    text: "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: GestureDetector(
                                onTap: () {
                                  getAllData();
                                },
                                child: Text(
                                  "Lihat Semua",
                                  style: mServiceSeeAll,
                                ),
                              ))
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      // padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: const BoxDecoration(
                          // color: mFillColor,
                          // borderRadius: BorderRadius.circular(12),
                          // border: Border.all(color: mBorderColor, width: 1)
                          ),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.separated(
                                scrollDirection: Axis.horizontal,
                                // reverse: true,
                                // physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                // scrollDirection: Axis.vertical,
                                itemCount: dataPenumuman == null
                                    ? 0
                                    : dataPenumuman.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 5,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return buildTaskItem(
                                      "${dataPenumuman[index]['judul']}",
                                      dataPenumuman[index],
                                      Colors.white);
                                })
                          ],
                        ),
                        // SizedBox(height: 10)
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              )
            : Container();
  }

  Container buildTaskItem(String courseTitle, data, Color color) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // print(isi);
          Navigator.pushNamed(context, DetailPengumumanSiswaWaliMurid.routeName,
              arguments: data);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(12),
          // height: 140,
          width: 155,
          decoration: BoxDecoration(
            color: mFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: mBorderColor, width: 1),
          ),
          child: Text(
            courseTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
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
      'username': data['username']
    };
    try {
      final response = await http.get("${pengumunan}/${data['id_hakakses']}/2",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataPenumuman = responseJson['result'];
        } else if (status == false && code == 403) {
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
                        context, HomeWaliMurid.routeName, (r) => false);
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }

    return 'success';
  }

  Future<String> getAllData() async {
    setState(() {
      isLoadingAll = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response = await http
          .get("${pengumunan}/${data['id_hakakses']}/1000", headers: headers);
      responseJsonAll = json.decode(response.body);
      setState(() {
        isLoadingAll = false;
        status = responseJsonAll['status'];
        code = responseJsonAll['code'];
        if (status == true && code == 200) {
          dataPenumumanAll = responseJsonAll['result'];
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              builder: (context) {
                return ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.bullhorn,
                        color: kPrimaryColor,
                      ),
                      title: const Text('Semua Pengumuman',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {},
                    ),
                    const Divider(
                      color: kPrimaryColor,
                    ),
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataPenumumanAll == null
                            ? 0
                            : dataPenumumanAll.length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.wysiwyg),
                                title: Text(
                                    "${dataPenumumanAll[index2]['judul']}"),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailPengumumanSiswaWaliMurid.routeName,
                                      arguments: dataPenumumanAll[index2]);
                                },
                              ),
                            ],
                          );
                        })
                  ],
                );
              });
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
        isLoadingAll = false;
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
