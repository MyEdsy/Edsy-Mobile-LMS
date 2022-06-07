import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../constants.dart';

class LaporanAbsenSiswaMenuWaliKelas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<LaporanAbsenSiswaMenuWaliKelas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 115,
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
                      "0989878767 - John Petrucci",
                      overflow: TextOverflow.ellipsis,
                      style: mTitleStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Image.network(
                        "https://st2.depositphotos.com/47577860/46284/v/450/depositphotos_462842714-stock-illustration-account-avatar-businessman-icon-in.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.present_to_all,
                                color: kColorTealSlow,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 60,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Hadir : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: "10",
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.sick_rounded,
                                color: kColorBlue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Sakit : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: "0",
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              ),
                              Icon(
                                Icons.pending_actions,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Izin : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: "0",
                                            style: mServiceTitleStyleBold),
                                      ]),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(
                                Icons.dangerous,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width - 160,
                                width: 60,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Alpha : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                          text: "15",
                                          style: mServiceTitleStyleBold,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.restore,
                                color: Colors.deepPurpleAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                // width: MediaQuery.of(context).size.width - 160,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: "Dispen : ",
                                      style: mServiceTitleStyle,
                                      children: [
                                        TextSpan(
                                            text: "0",
                                            style: mServiceTitleStyleBold),
                                      ]),
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
}
