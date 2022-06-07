import 'package:flutter/material.dart';
import 'package:school_apps/constants.dart';

import '../../../../../size_config.dart';

class WaliMuridAppointmentBackCard extends StatelessWidget {
  final String? patientComment;
  final dynamic dataNilai;
  final Function? onPhoneTapped;
  const WaliMuridAppointmentBackCard({
    Key? key,
    @required this.patientComment,
    @required this.dataNilai,
    @required this.onPhoneTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: SizeConfig2.horizontalBloc * 90,
          height: SizeConfig2.safeBlockVertical * 15,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    'Detail :',
                    style: TextStyle(
                      fontSize: SizeConfig2.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                )),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      width: SizeConfig2.safeBlockHorizontal * 80,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(1.0),
                              child:
                                  ListView.separated(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: dataNilai == null
                                          ? 0
                                          : dataNilai.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 0,
                                        );
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Text(
                                          '${dataNilai[index]['nama_komponen']} \t ${dataNilai[index]['nilai']}',
                                          style:
                                              const TextStyle(color: kPrimaryColor),
                                        );
                                      }),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              // onTap: onPhoneTapped!,
                              onTap: () {},
                              child: Container(),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
