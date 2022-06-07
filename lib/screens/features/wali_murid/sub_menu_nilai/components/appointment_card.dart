import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/components/appointment_back_card.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/components/appointment_front_card.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/detail_nilai_screen.dart';
import 'package:school_apps/server/api.dart';
import 'package:sliding_card/sliding_card.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';
import '../../../../../size_config.dart';

class WaliMuridAppointmentCard extends StatefulWidget {
  const WaliMuridAppointmentCard(
      {Key? key, this.slidingCardController, @required this.onCardTapped})
      : super(key: key);

  final SlidingCardController? slidingCardController;
  final Function? onCardTapped;

  @override
  _WaliMuridAppointmentCardState createState() => _WaliMuridAppointmentCardState();
}

class _WaliMuridAppointmentCardState extends State<WaliMuridAppointmentCard> {
  bool status = false;
  var isLoading = false;
  int code = 0;
  var responseJson;
  var dataNilai;
  var nilaiDetail;
  var data = jsonDecode(dataUserLogin);

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
    return GestureDetector(
        onTap: () {
          print('Well the card was tapped');
          widget.onCardTapped!();
        },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SlidingCard(
                slimeCardElevation: 0.5,
                // slidingAnimationReverseCurve: Curves.bounceInOut,
                cardsGap: SizeConfig2.safeBlockVertical,
                controller: widget.slidingCardController,
                slidingCardWidth: SizeConfig2.horizontalBloc * 90,
                visibleCardHeight: SizeConfig2.safeBlockVertical * 27,
                hiddenCardHeight: SizeConfig2.safeBlockVertical * 15,
                frontCardWidget: WaliMuridAppointmentFrontCard(
                  imgLink: '',
                  grade: 'Grade \t ${dataNilai['grade']}',
                  nilai: 'Nilai Akhir \t ${dataNilai['nilai']}',
                  keterangan: '🟢 ${dataNilai['keterangan']}',
                  appointmentDate: '12 Jan 2020 ',
                  appointmentTime: '12Am',
                  onInfoTapped: () {
                    print('info pressed');
                    widget.slidingCardController?.expandCard();
                  },
                  onDecline: () {
                    print('Declined');
                  },
                  onAccep: () {
                    print('Accepted');
                  },
                  onRedCloseButtonTapped: () {
                    widget.slidingCardController?.collapseCard();
                  },
                ),
                backCardWidget: WaliMuridAppointmentBackCard(
                  onPhoneTapped: () {
                    print('Phone tapped');
                  },
                  patientComment: '-',
                  dataNilai: dataNilai['komDanNilai'],
                ),
              ));
  }

  // _nilaiDetail() {
  //   for(var i = 0; i < dataNilai['keterangan']['komDanNilai'].length; i++){
  //     print(dataNilai['keterangan']['komDanNilai'][i]['nama_komponen']);
  //     nilaiDetail = dataNilai['keterangan']['komDanNilai'][i]['nama_komponen'];
  //   }
  // }

  Future getData() async {
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
      final response = await http.post('${nilaiFinalByNisn}',
          headers: headers,
          body: jsonEncode({
            "idkomponen":
                "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['idKomponen']}",
            "nip": "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['NIP']}",
            "nisn": data['nisn'],
            "kode_mapel":
                "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['idMapel']}",
            "idkelompokkls":
                "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['idkelompokkls']}",
            "tahunakademik":
                "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['Tahun']}",
            "semester": "${WaliMuridDetailNilaiSiswaScrenn.dataYangDikirim['semester']}"
          }));
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true && code == 200) {
        // Navigator.pushNamed(context, AbsenKelasScreen.routeName,
        //     arguments: dataAbsenGuru);
        dataNilai = responseJson['result'];
        // for (var i = 0;
        //     i < dataNilai['komDanNilai'].length;
        //     i++) {
        //   print(dataNilai['komDanNilai'][i]['nama_komponen']);
        //   setState(() {
        //     nilaiDetail =
        //     dataNilai['komDanNilai'][i]['nama_komponen'];
        //   });
        // }
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Future.delayed(const Duration(seconds: 1)).then((value) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['message'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Future.delayed(const Duration(seconds: 1)).then((value) {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Terjadi kesalahan pada server",
                btnOkOnPress: () {},
                btnOkIcon: Icons.cancel,
                btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }
}
