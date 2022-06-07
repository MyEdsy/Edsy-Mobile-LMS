import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/edit_nilai_screen.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import '../../../../../../../constants.dart';

class WaliKelasLihatNilai extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<WaliKelasLihatNilai> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 140,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   height: 214,
              //   width: 1,
              //   color: Colors.grey.withOpacity(0.5),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "0989878767 - John Petrucci",
                      overflow: TextOverflow.ellipsis,
                      style: mTitleStyle,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.network(
                        "https://st2.depositphotos.com/47577860/46284/v/450/depositphotos_462842714-stock-illustration-account-avatar-businessman-icon-in.jpg",
                        height: 80,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.book_outlined,
                                color: kColorBlue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 100,
                                  child: Text(
                                    "Matematika",
                                    overflow: TextOverflow.ellipsis,
                                    style: mServiceTitleStyle,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.account_balance_sharp,
                                color: Colors.teal,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                  child: Text(
                                    "X IPA 1",
                                    overflow: TextOverflow.ellipsis,
                                    style: mServiceTitleStyle,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_chart,
                                color: Colors.purpleAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 100,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Nilai Akhir : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: "86",
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.grade,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Bobot : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: "A",
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _showDialogInputNilai(),
                                // onTap: () => Navigator.pushNamed(context, AbsenKelasScreen.routeName),
                                child: Chip(
                                  avatar: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  backgroundColor: kColorTealToSlow,
                                  label: Text("Detail",
                                      style: mTitleStyleColorWhite),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void _showDialogInputNilai() {
    slideDialog.showSlideDialog(
      context: context,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Text("Detail Nilai John Petrucci", style: mTitleStyle,),
            SizedBox(
              height: 20,
            ),
            // Image.network(
            //   "https://s0.bukalapak.com/uploads/content_attachment/5ce6046096a521426eccd9b5/original/main-foto.jpg",
            //   height: 80,
            //   width: 60,
            //   fit: BoxFit.cover,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.book_outlined,
                      color: kColorBlue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 120,
                        child: Text("Matematika", overflow: TextOverflow.ellipsis, style: mServiceTitleStyle,)
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.account_balance_sharp,
                      color: Colors.teal,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                        child: Text("X IPA 1", overflow: TextOverflow.ellipsis, style: mServiceTitleStyle,)
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(
                      Icons.call_to_action_sharp,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      width: 120,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "Tugas 1 : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                text: "86",
                                style: mServiceTitleStyleBold,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.call_to_action_sharp,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "Tugas 2 : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                  text: "80",
                                  style: mServiceTitleStyleBold
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(
                      Icons.call_to_action_sharp,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      width: 120,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "UTS : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                text: "86",
                                style: mServiceTitleStyleBold,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.call_to_action_sharp,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "UAS : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                  text: "90",
                                  style: mServiceTitleStyleBold
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(
                      Icons.add_chart,
                      color: Colors.purpleAccent,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      width: 120,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "Nilai Akhir : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                text: "86",
                                style: mServiceTitleStyleBold,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.grade,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 160,
                      child:
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "Bobot : ",
                            style: mServiceTitleStyle,
                            children: [
                              TextSpan(
                                  text: "A",
                                  style: mServiceTitleStyleBold
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10,),
                // Container(
                //   // width: MediaQuery.of(context).size.width - 160,
                //     child: Row(
                //       children: [
                //         SizedBox(width: 5,),
                //         GestureDetector(
                //           onTap: () => Navigator.pushNamed(context, EditNilai.routeName),
                //           child: Chip(
                //             avatar: Icon(Icons.edit,
                //               color: Colors.white,
                //               size: 20,),
                //             backgroundColor: kColorYellow,
                //             label: Text(
                //                 "Edit Nilai",
                //                 style: mTitleStyleColorWhite
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 5,),
                //       ],
                //     )
                // ),
              ],
            ),
          ],
        ),
      ),
      barrierColor: Colors.white.withOpacity(0.7),
      pillColor: kPrimaryColor,
      // barrierDismissible: false,
      backgroundColor: Colors.white,
    );
  }
}
