import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/constants.dart';
import 'package:school_apps/server/api.dart';

import '../../../../../main.dart';
import '../../../../../size_config.dart';

class WaliMuridAppointmentFrontCard extends StatefulWidget {
  final String? patienName;
  final String? patienSurname;
  final Function? onInfoTapped;
  final Function? onRedCloseButtonTapped;
  final Function? onAccep;
  final Function? onDecline;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? imgLink;
  final String? nilai;
  final String? grade;
  final String? keterangan;
  const WaliMuridAppointmentFrontCard({
    Key? key,
    @required this.imgLink,
    @required this.onAccep,
    @required this.onDecline,
    @required this.patienName,
    @required this.onInfoTapped,
    @required this.patienSurname,
    @required this.appointmentDate,
    @required this.appointmentTime,
    @required this.onRedCloseButtonTapped,
    @required this.nilai,
    @required this.grade,
    @required this.keterangan,
  }) : super(key: key);
  @override
  _WaliMuridAppointmentFrontCardState createState() => _WaliMuridAppointmentFrontCardState();
}

class _WaliMuridAppointmentFrontCardState extends State<WaliMuridAppointmentFrontCard> {
  bool isinfoPressed = false;
  var data = jsonDecode(dataUserLogin);
  var dataTahunAjaran = jsonDecode(tahunAjaranPref);
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${args['Namamapel']}',
                            style: TextStyle(
                                fontSize: SizeConfig2.safeBlockHorizontal * 4.5,
                                color: Colors.white),
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.more_vert,color: Colors.white70,
                        //     size: SizeConfig2.safeBlockHorizontal * 7,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.user,
                          size: SizeConfig2.safeBlockHorizontal * 5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          width: 300,
                          child: Text(
                            '${data['nama']}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: SizeConfig2.safeBlockHorizontal * 3.7,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      width: SizeConfig2.safeBlockHorizontal * 90,
                      //color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.nilai!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                      SizeConfig2.safeBlockHorizontal * 4.7,
                                      color: kPrimaryColor),
                                ),
                                Text(
                                  widget.grade!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                      SizeConfig2.safeBlockHorizontal * 4.7,
                                      color: kPrimaryColor),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  widget.keterangan!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: kPrimaryColor),
                                )
                              ],
                            ),
                          ),
                          // Expanded(
                          //   flex: 2,
                          //   child: GestureDetector(
                          //     onTap: (){
                          //       if(isinfoPressed == true)
                          //       {
                          //         isinfoPressed = false;
                          //         widget.onRedCloseButtonTapped!();
                          //         setState(() {});
                          //       }
                          //       else{
                          //         isinfoPressed = true;
                          //         widget.onInfoTapped!();
                          //         setState(() {});
                          //       }
                          //     },
                          //     child: Container(
                          //       //color: Colors.red,
                          //       child: isinfoPressed?Transform.rotate(
                          //         angle: 0.7777,
                          //         child: Icon(
                          //           Icons.add_circle,
                          //           size: SizeConfig2.safeBlockHorizontal * 9,
                          //           color: Colors.redAccent,
                          //         ),
                          //       )
                          //
                          //
                          //           :Icon(
                          //         Icons.info,
                          //         size: SizeConfig2.safeBlockHorizontal * 9,
                          //         color: Colors.blue,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 8.0),
                  //     child: Container(
                  //       width: SizeConfig2.safeBlockHorizontal * 90,
                  //       //color: Colors.indigo,
                  //       child: Row(
                  //         children: <Widget>[
                  //           Expanded(
                  //             flex: 3,
                  //             child: SizedBox(
                  //               height: SizeConfig2.safeBlockVertical * 6,
                  //               child: RaisedButton(
                  //                 disabledElevation: 0,
                  //                 focusElevation: 0,
                  //                 highlightElevation: 0,
                  //                 hoverElevation: 0,
                  //                 elevation: 0.5,
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(50)),
                  //                 textColor: Colors.white,
                  //                 color: Colors.blue,
                  //                 child: Text(
                  //                   'accept',
                  //                   style: TextStyle(
                  //                     fontSize:
                  //                     SizeConfig2.safeBlockHorizontal * 5.5,
                  //                   ),
                  //                 ),
                  //                 // onPressed: widget.onAccep!,
                  //                 onPressed: (){},
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Expanded(
                  //             flex: 2,
                  //             child: SizedBox(
                  //               height: SizeConfig2.safeBlockVertical * 6,
                  //               child: RaisedButton(
                  //                 disabledElevation: 0,
                  //                 focusElevation: 0,
                  //                 highlightElevation: 0,
                  //                 hoverElevation: 0,
                  //                 elevation: 0,
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(50)),
                  //                 textColor: Colors.black26,
                  //                 color: Color(0xffEBEFFB),
                  //                 child: Text(
                  //                   'Decline',
                  //                   style: TextStyle(
                  //                     color: Color(0xff878FA6) ,
                  //                     fontSize:
                  //                     SizeConfig2.safeBlockHorizontal * 5,
                  //                   ),
                  //                 ),
                  //                 // onPressed: widget.onDecline,
                  //                 onPressed: (){},
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

