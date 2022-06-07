import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_week/calendar_week.dart';
import 'package:flutter_calendar_week/model/decoration_item.dart';
import 'package:school_apps/components/slider_no_jadwal.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import 'package:http/http.dart' as http;

import '../../../../../main.dart';
import '../../../../OnBoarding/OnBoarding.dart';


class ComponentJadwalPelajaran extends StatefulWidget {
  const ComponentJadwalPelajaran({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<ComponentJadwalPelajaran> {
  late DateTime _selectedDate;

  var isLoading = false;
  var responseJson, dataMapel;
  var code;
  late bool status = false;

  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  var date = DateTime.now();
  var test;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      getData(nameDay(date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${perseDate()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF263064),
                          fontSize: 22,
                        ),
                        children: const [
                          TextSpan(
                            text: "",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Text(
                "Hari ${nameDay(date)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF3E3993),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 70,
          child: Container(
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                calendar(),
                const SizedBox(height: 30,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        isLoading
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Shimmer.fromColors(
                            baseColor: mGreyColor,
                            highlightColor: mGreyColor,
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, __) => (dummyListViewCell()),
                              itemCount: 10,
                            ),
                          ),
                        ): dataMapel.length > 0 ? _data() : SliderNoJadwal()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  _data() {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: dataMapel == null ? 0 : dataMapel.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              var gelarDpn;
              if (dataMapel[index]['Gelardepan'] == null) {
                gelarDpn = '';
              } else {
                gelarDpn = dataMapel[index]['Gelardepan'] + ' ';
              }
              return  _getJadwal(
                  '${dataMapel[index]['hari']}',
                  '${dataMapel[index]['jam_mulai']}',
                  '${dataMapel[index]['jam_selesai']}',
                  '${dataMapel[index]['Namamapel']}',
                  '$gelarDpn ${dataMapel[index]['Nama']} ${dataMapel[index]['Gelarbelakang'] == null ? '' : dataMapel[index]['Gelarbelakang']}',
                  '${dataMapel[index]['kode_kelompok']}',
                  dataMapel[index]['adaKelas'],
                  '${dataMapel[index]['Namakelas']}'
              );
              // buildTaskListItem(dataMapel[index]['Namamapel'], '${dataMapel[index]['JamMulai']} - ${dataMapel[index]['JamMulai']}', " ");
            }),
        const SizedBox(height: 40)
      ],
    );
  }

  _getJadwal(hari, jamAwal, jamAkhir, mapel, guru, kelas, adaKelas, ruang) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 10,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5),
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '${hari} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '${jamAwal} - ${jamAkhir}',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kColorTealToSlow))
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 119,
            width: double.infinity,
            decoration: BoxDecoration(
              // border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(right: 10, left: 30),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mapel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          guru,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.meeting_room,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kelas,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
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

  Widget calendar() {
    // var date = DateTime.now();
    // print(nameDay(date));
    return Container(
      padding: const EdgeInsets.all(1.0),
      height: 55,
      width: double.infinity,
      child: CalendarWeek(
        // height: 55,
        minDate: DateTime.now().add(
          const Duration(days: -10),
        ),
        maxDate: DateTime.now().add(
          const Duration(days: 10),
        ),
        onDatePressed: (DateTime datetime) {
          setState(() {
            setState(() {
              _selectedDate = datetime;
              getData(nameDay(datetime));
            });
          });
        },
        onDateLongPressed: (DateTime datetime) {
          setState(() {
            _selectedDate = datetime;
          });
        },
        dayOfWeekStyle:
        const TextStyle(color: Colors.grey, fontSize: 12),
        dayOfWeekAlignment: FractionalOffset.bottomCenter,
        dateStyle:
        const TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),
        dateAlignment: FractionalOffset.topCenter,
        todayDateStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        todayBackgroundColor: Color(0xff402fcc),
        pressedDateBackgroundColor: Colors.blue,
        pressedDateStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        dateBackgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        dayOfWeek: const ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'],
        spaceBetweenLabelAndDate: 2,
        dayShapeBorder: const CircleBorder(),
        decorations: [
          DecorationItem(
            decorationAlignment: FractionalOffset.bottomRight,
            date: DateTime.now(),
          ),
        ],
      ),
    );
  }

  Future<String> getData(hari) async {
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
          "${jadwalSiswaByNisnHariIni}${dataTahunAjaran['tahunakademik']}/${dataTahunAjaran['semester']}/${data['nisn']}/${hari}",
          headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataMapel = responseJson['result'];
        } else if (status == false && code == 403) {
          dataMapel = [];
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
      if(mounted) {
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
}