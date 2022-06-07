import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/helper/utils_apps.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/input_file_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/input_video_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/respones/bahanMengajarResponse.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../constants.dart';
import '../../../../../../main.dart';
import 'package:school_apps/server/api.dart';
import 'package:http/http.dart' as http;

import '../../../../../OnBoarding/OnBoarding.dart';
import '../../bahan_ajar_screen.dart';
import '../bahan_ajar_screen.dart';
import '../play_video_screen.dart';

class WaliMuridComponentBahanAjar extends StatefulWidget {
  const WaliMuridComponentBahanAjar({Key? key}) : super(key: key);

  @override
  _WaliMuridComponentBahanAjar createState() => _WaliMuridComponentBahanAjar();
}

class _WaliMuridComponentBahanAjar extends State<WaliMuridComponentBahanAjar> {
  var isLoading = false, isLoadingVideo = false, isLoadingFile = false;
  var responseJson,
      dataBahanAjar,
      responseJsonVideo,
      dataVideo,
      responseJsonFile,
      dataFile;
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
            itemCount: dataBahanAjar == null ? 0 : dataBahanAjar.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return _listMataPelajaran(
                dataBahanAjar[index]['judul'],
                dataBahanAjar[index]['keterangan'],
                GestureDetector(
                  // onTap: () => Navigator.pushNamed(
                  //     context, InputKategoriNilai.routeName,
                  //     arguments: dataMapel[index]),
                  onTap: () {
                    setState(() {
                      getDatavideo(dataBahanAjar[index]['id']);
                    });
                  },
                  child: const Chip(
                    materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    avatar: Icon(
                      Icons.video_call,
                      color: Colors.white,
                      size: 20,
                    ),
                    backgroundColor: kColorBlue,
                    label: Text(
                      "Video",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      getDataFile(dataBahanAjar[index]['id']);
                    });
                  },
                  child: const Chip(
                    materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    avatar: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    backgroundColor: kPrimaryColor,
                    label: Text(
                      "File",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     var bahanAjar = {"bahanAjar": dataBahanAjar[index]};
                //     var newData = {};
                //     newData.addAll(bahanAjar);
                //     newData.addAll(BahanMengajar.dataMapelPerIndex);
                //     Navigator.pushNamed(
                //         context, UpdateBahanAjar.routeName,
                //         arguments: newData);
                //   },
                //   child: const Chip(
                //     materialTapTargetSize:
                //         MaterialTapTargetSize.shrinkWrap,
                //     avatar: Icon(
                //       Icons.edit,
                //       color: Colors.white,
                //       size: 20,
                //     ),
                //     backgroundColor: kColorYellow,
                //     label: Text(
                //       "Edit",
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   // onTap: () => Navigator.pushNamed(
                //   //     context, InputKategoriNilaiKeterampilan.routeName,
                //   //     arguments: dataMapel[index]),
                //   child: const Chip(
                //     materialTapTargetSize:
                //     MaterialTapTargetSize.shrinkWrap,
                //     avatar: Icon(
                //       Icons.restore_from_trash_rounded,
                //       color: Colors.white,
                //       size: 20,
                //     ),
                //     backgroundColor: kColorRedSlow,
                //     label: Text(
                //       "Hapus",
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //   ),
                // )
              );
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

  _listMataPelajaran(
      String judul,
      String keterangan,
      GestureDetector video,
      GestureDetector file,
      // GestureDetector ubah,
      ) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(15),
      height: 125,
      decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  judul,
                  overflow: TextOverflow.ellipsis,
                  style: (const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.class__rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      keterangan,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [video],
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width - 160,
                      child: Row(
                        children: [file],
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  // Container(
                  //     // width: MediaQuery.of(context).size.width - 160,
                  //     child: Row(
                  //   children: [ubah],
                  // )),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _popPlayVideo(id, name, link, context) {
    String linkVideo;
    linkVideo = YoutubePlayer.convertUrlToId(link)!;
    // set up the buttons
    Widget editButton = GestureDetector(
        onTap: () => {Navigator.of(context).pop()},
        child: const Chip(
          avatar: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          backgroundColor: kColorYellow,
          label: Text("Edit",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));
    Widget hapusButton = GestureDetector(
        onTap: () =>
        {KomponenBahanAjarResponse.hapusVideoBahanAjar(id, context)},
        child: const Chip(
          avatar: Icon(
            Icons.restore_from_trash_sharp,
            color: Colors.white,
          ),
          backgroundColor: kColorRedSlow,
          label: Text("Hapus",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));
    Widget cancelButton = GestureDetector(
        onTap: () => {Navigator.of(context).pop()},
        child: const Chip(
          avatar: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          backgroundColor: kColorRedSlow,
          label: Text("Batal",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        name,
        style: mTitleStyle16,
      ),
      content: Container(
        height: 175,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: linkVideo, //Add videoID.
                flags: const YoutubePlayerFlags(
                  hideControls: false,
                  controlsVisibleAtStart: true,
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: kPrimaryColor,
            ),
          ],
        ),
      ),
      actions: [editButton, hapusButton, cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
    // print(BahanMengajar.dataMapelPerIndex);
    try {
      final response = await http.get(
          "${bahanAjar}${WaliMuridBahanMengajarSiswa.dataMapelPerIndex['Nip']}/${WaliMuridBahanMengajarSiswa.dataMapelPerIndex['idMapel']}/${WaliMuridBahanMengajarSiswa.dataMapelPerIndex['idkelompokkls']}",
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
          dataBahanAjar = responseJson['result'];
        } else if (status == false && code == 403) {
          // AwesomeDialog(
          //         context: context,
          //         dialogType: DialogType.WARNING,
          //         animType: AnimType.RIGHSLIDE,
          //         headerAnimationLoop: true,
          //         title: 'Peringatan',
          //         desc:
          //             '${responseJson['message']}, Klik Ok untuk membuat bahan mengajar',
          //         btnOkOnPress: () {
          //           Navigator.pushNamed(context, InputBahanAjar.routeName,
          //               arguments: BahanMengajar.dataMapelPerIndex);
          //         },
          //         btnOkIcon: Icons.check,
          //         onDissmissCallback: (type) {},
          //         btnOkColor: kColorYellow)
          //     .show();
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

  Future<String> getDatavideo(id) async {
    setState(() {
      isLoadingVideo = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response =
      await http.get("${bahanAjarVideo}${id}", headers: headers);

      responseJsonVideo = json.decode(response.body);

      setState(() {
        isLoadingVideo = false;
        status = responseJsonVideo['status'];
        code = responseJsonVideo['code'];
        if (status == true && code == 200) {
          dataVideo = responseJsonVideo['result'];
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
                        FontAwesomeIcons.video,
                        color: kPrimaryColor,
                      ),
                      title: const Text('Materi Video',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        // var idBahanAjar = {"idBahanAjar": id};
                        // var newData = {};
                        // newData.addAll(idBahanAjar);
                        // newData.addAll(BahanMengajar.dataMapelPerIndex);
                        // Navigator.pushNamed(context, InputVideo.routeName,
                        //     arguments: newData);
                      },
                    ),
                    const Divider(
                      color: kPrimaryColor,
                    ),
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataVideo == null ? 0 : dataVideo.length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.video_call),
                                title: Text(dataVideo[index2]['judul_video'] ??
                                    'Tidak ada data'),
                                onTap: () {
                                  // _popPlayVideo(
                                  //     dataVideo[index2]['id'],
                                  //     dataVideo[index2]['judul_video'],
                                  //     dataVideo[index2]['link'],
                                  //     context);

                                  // Navigator.pushNamed(context, PlayVideoSiswa.routeName,  arguments: dataVideo[index2]);
                                  if (dataVideo[index2]['sumber_youtube'] ==
                                      'Y') {
                                    Navigator.pushNamed(
                                        context, PlayVideoSiswaWaliMurid.routeName,
                                        arguments: dataVideo[index2]);
                                  } else {
                                    _launchInBrowser(
                                        '${dataVideo[index2]['link']}');
                                  }
                                },
                              ),
                            ],
                          );
                        })
                  ],
                );
              });
        } else if (status == false && code == 403) {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: const Radius.circular(15.0)),
              ),
              builder: (context) {
                return ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.add_circle,
                        color: kPrimaryColor,
                      ),
                      title: const Text('Tambah Video',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        var idBahanAjar = {"idBahanAjar": id};
                        var newData = {};
                        newData.addAll(idBahanAjar);
                        newData.addAll(WaliMuridBahanMengajarSiswa.dataMapelPerIndex);
                        Navigator.pushNamed(context, InputVideo.routeName,
                            arguments: newData);
                      },
                    ),
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
        isLoadingVideo = false;
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

  Future<String> getDataFile(id) async {
    setState(() {
      isLoadingFile = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };

    try {
      final response =
      await http.get("${bahanAjarFile}${id}", headers: headers);

      responseJsonFile = json.decode(response.body);

      setState(() {
        isLoadingFile = false;
        status = responseJsonFile['status'];
        code = responseJsonFile['code'];
        if (status == true && code == 200) {
          dataFile = responseJsonFile['result'];
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
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
                        FontAwesomeIcons.file,
                        color: kPrimaryColor,
                      ),
                      title: const Text('Materi File',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        // var idBahanAjar = {"idBahanAjar": id};
                        // var newData = {};
                        // newData.addAll(idBahanAjar);
                        // newData.addAll(BahanMengajar.dataMapelPerIndex);
                        // Navigator.pushNamed(context, InputFile.routeName,
                        //     arguments: newData);
                      },
                    ),
                    const Divider(
                      color: kPrimaryColor,
                    ),
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataFile == null ? 0 : dataFile.length,
                        itemBuilder: (BuildContext context, int index2) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.insert_drive_file_sharp),
                                title: Text(dataFile[index2]['judul_file'] ??
                                    'Tidak ada data'),
                                onTap: () {
                                  _launchInBrowser('${baseUrlMateriBahanFile}${dataFile[index2]['file']}');
                                },
                              ),
                            ],
                          );
                        })
                  ],
                );
              });
        } else if (status == false && code == 403) {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
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
                        Icons.add_circle,
                        color: kPrimaryColor,
                      ),
                      title: const Text('Tambah File',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        var idBahanAjar = {"idBahanAjar": id};
                        var newData = {};
                        newData.addAll(idBahanAjar);
                        newData.addAll(WaliMuridBahanMengajarSiswa.dataMapelPerIndex);
                        Navigator.pushNamed(context, InputFile.routeName,
                            arguments: newData);
                      },
                    ),
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
        isLoadingVideo = false;
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

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
