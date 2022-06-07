import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../constants.dart';
import '../laporan_absen_wali_kelas_screen.dart';



class ComponentMataPelajaranMenuWalKelLihatAbsen extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<ComponentMataPelajaranMenuWalKelLihatAbsen> {

  late DateTime tglMulai = DateTime.now(), tglSelesai= DateTime.now();
  var strTglMulai;
  TextEditingController txtFilterTglMulai = TextEditingController(),
      txtFilterTglSelesai = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 135,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "07:00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PAGI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Matematika",
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight:  FontWeight.bold)),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.class__rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Text(
                          "X IPA 1",
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://rotasinews.com/wp-content/uploads/2016/12/dekanfik.jpg"),
                        radius: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Ahmad Cucus Ph.D",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width - 160,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  print("adada");
                                  _showDialog(context);
                                },
                                // onTap: () => Navigator.pushNamed(context, AbsenKelasScreen.routeName),
                                child: Chip(
                                  avatar: Icon(Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 20,),
                                  backgroundColor: kColorTealSlow,
                                  label: Text(
                                    "Lihat Data",
                                    style: TextStyle(
                                        fontWeight:  FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 135,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "13:00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "SIANG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "FISIKA",
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight:  FontWeight.bold)),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.class__rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Text(
                          "X IPA 2",
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://rotasinews.com/wp-content/uploads/2016/12/dekanfik.jpg"),
                        radius: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Ahmad Cucus Ph.D",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width - 160,
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Chip(
                                  avatar: Icon(Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 20,),
                                  backgroundColor: kColorTealSlow,
                                  label: Text(
                                    "Lihat Data",
                                    style: TextStyle(
                                        fontWeight:  FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Batal"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit"),
      onPressed:  () {
        // LaporanAbsenKelasScreen
        Navigator.pushNamed(context, WaliKelasLaporanAbsenKelasScreen.routeName);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pilih Tanggal", style: mTitleStyle16,),
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: txtFilterTglMulai,
              onTap: () {
                _tglMulai(context);
              },
              textInputAction: TextInputAction.next,
              focusNode: AlwaysDisabledFocusNode(),
              style: TextStyle(
                  fontFamily: "Poppins-Bold",
                  color: Color.fromRGBO(58, 66, 86, 1.0)
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: 'Pilih tanggal',
                labelText: 'Tanggal mulai',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: txtFilterTglSelesai,
              onTap: () {
                _tglSelesai(context);
              },
              textInputAction: TextInputAction.next,
              focusNode: AlwaysDisabledFocusNode(),
              style: TextStyle(
                // fontSize: ScreenUtil.getInstance().setSp(25),
                  fontFamily: "Poppins-Bold",
                  color: Color.fromRGBO(58, 66, 86, 1.0)
                // letterSpacing: .6
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range_sharp),
                hintText: 'Pilih tanggal',
                labelText: 'Tanggal Selesai',
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _tglMulai(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: tglMulai != null ? tglMulai : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (newSelectedDate != null) {
      tglMulai = newSelectedDate;
      var tanggal = tglMulai.toString().split(" ");
      txtFilterTglMulai
        ..text = tanggal[0]
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: txtFilterTglMulai.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _tglSelesai(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: tglSelesai != null ? tglSelesai : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (newSelectedDate != null) {
      tglSelesai = newSelectedDate;
      var tanggal = tglSelesai.toString().split(" ");
      txtFilterTglSelesai
        ..text = tanggal[0]
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: txtFilterTglSelesai.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}