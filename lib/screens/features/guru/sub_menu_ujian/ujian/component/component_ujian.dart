import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/utils/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../home_guru.dart';
import '../detail_ujian_screens.dart';
import '../update_ujian_screens.dart';

class ComponentUjian extends StatefulWidget {
  @override
  _ComponentUjian createState() => _ComponentUjian();
}

class _ComponentUjian extends State<ComponentUjian>
    with TickerProviderStateMixin {
  var isLoading = false, isLoadingVideo = false, isLoadingFile = false;
  var responseJson, dataTugas;
  var status, code;

  AnimationController? animationController;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: mGreyColor,
              highlightColor: mGreyColor,
              child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, __) => (dummyListViewCell()),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1)),
            ),
          )
        : GridView(
            primary: false,
            shrinkWrap: true,

            // padding: const EdgeInsets.all(8),
            // physics: const BouncingScrollPhysics(),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List<Widget>.generate(
              dataTugas.length,
              (int index) {
                final int count = dataTugas.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animationController!,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                animationController?.forward();
                return _tugasSiswaCard(
                    count,
                    index,
                    dataTugas[index]['nama_tugas'],
                    dataTugas[index]['type'],
                    '${parseDateIndo(dataTugas[index]['tgl_mulai'])}',
                    '${parseDateIndo(dataTugas[index]['tgl_selesai'])}',
                    dataTugas[index],
                    'assets/images/learn.png',
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DetailUjian.routeName,
                            arguments: {
                              "NIP": MenuUjian.dataMapelPerIndex['NIP'],
                              "idMapel": MenuUjian.dataMapelPerIndex['idMapel'],
                              "idkelompokkls":
                              MenuUjian.dataMapelPerIndex['idkelompokkls'],
                              "Namamapel" : MenuUjian.dataMapelPerIndex['Namamapel'],
                              "KelompokKelas" : MenuUjian.dataMapelPerIndex['KelompokKelas'],
                              "NamaKelompokKelas" : MenuUjian.dataMapelPerIndex['NamaKelompokKelas'],
                              "Jurusan" : MenuUjian.dataMapelPerIndex['Jurusan'],
                              "nama_tugas": dataTugas[index]['nama_tugas'],
                              "keterangan": dataTugas[index]['keterangan'],
                              "tgl_mulai": dataTugas[index]['tgl_mulai'],
                              "tgl_selesai": dataTugas[index]['tgl_selesai'],
                              "id": dataTugas[index]['id']
                            });
                      },
                      child: const Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        avatar: Icon(
                          Icons.upload_file,
                          color: Colors.white,
                          size: 20,
                        ),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        backgroundColor: kColorBlue,
                        label: Text(
                          "Kelola",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, UpdateUjian.routeName,
                            arguments: {
                              "NIP": MenuUjian.dataMapelPerIndex['NIP'],
                              "idMapel": MenuUjian.dataMapelPerIndex['idMapel'],
                              "idkelompokkls":
                              MenuUjian.dataMapelPerIndex['idkelompokkls'],
                              "Namamapel" : MenuUjian.dataMapelPerIndex['Namamapel'],
                              "KelompokKelas" : MenuUjian.dataMapelPerIndex['KelompokKelas'],
                              "NamaKelompokKelas" : MenuUjian.dataMapelPerIndex['NamaKelompokKelas'],
                              "Jurusan" : MenuUjian.dataMapelPerIndex['Jurusan'],
                              "nama_tugas": dataTugas[index]['nama_tugas'],
                              "keterangan": dataTugas[index]['keterangan'],
                              "tgl_mulai": dataTugas[index]['tgl_mulai'],
                              "tgl_selesai": dataTugas[index]['tgl_selesai'],
                              "id": dataTugas[index]['id']
                            });
                      },
                      child: const Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        avatar: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        backgroundColor: kColorYellow,
                        label: Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    context);
              },
            ),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              height: 290.0,
            ),
          );
  }

  _tugasSiswaCard(
      count,
      index,
      String name,
      type,
      date_mulai,
      date_selesai,
      data,
      String imgPath,
      GestureDetector lihatSoal,
      GestureDetector edit,
      context) {
    final Animation<double> animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              // onTap: callback,
              child: SizedBox(
                  height: 280,
                  child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                          onTap: () {
                            print(index);
                            // Navigator.pushNamed(context, MenuTugas.routeName,
                            //     arguments: data);
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text(name,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF575E67),
                                                  // fontFamily: 'Varela',
                                                  fontSize: 16.0)),
                                        )
                                      ],
                                    ),
                                    Hero(
                                        tag: index,
                                        child: Container(
                                            height: 90.0,
                                            width: 140.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      imgPath,
                                                    ),
                                                    fit: BoxFit.contain)))),
                                    // SizedBox(height: 7.0),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: kColorTealSlow,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            date_mulai,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                // fontFamily: 'Varela',
                                                fontSize: 12.0),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: kColorRedSlow,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            date_selesai,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: kPrimaryColor,
                                                // fontFamily: 'Varela',
                                                fontSize: 12.0),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                            color: Color(0xFFEBEBEB),
                                            height: 1.0)),
                                    lihatSoal,
                                    SizedBox(
                                      height: 5,
                                    ),
                                    edit
                                  ]))))),
            ),
          ),
        );
      },
    );
  }

  Widget dummyListViewCell() {
    return Padding(
        padding:
            EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
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
                      SizedBox(height: 7.0),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Container(color: Color(0xFFEBEBEB), height: 1.0)),
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
          "${getTugas}Ujian/${MenuUjian.dataMapelPerIndex['NIP']}/${MenuUjian.dataMapelPerIndex['idMapel']}/${MenuUjian.dataMapelPerIndex['idkelompokkls']}/${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}",
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
          dataTugas = responseJson['result'];
        } else if (status == false && code == 403) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc:
                      '${responseJson['message']}, Klik Ok untuk membuat bahan mengajar',
                  btnOkOnPress: () {
                    // Navigator.pushNamed(context, InputBahanAjar.routeName,
                    //     arguments: BahanMengajar.dataMapelPerIndex);
                  },
                  btnOkIcon: Icons.check,
                  onDissmissCallback: (type) {},
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
                        context, SignInScreen.routeName, (r) => false);
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
                      context, HomeGuru.routeName, (r) => false);
                },
                btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
