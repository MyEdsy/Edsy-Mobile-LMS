import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constants.dart';


class TotalAbsenPerMatPel extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<TotalAbsenPerMatPel> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Absensi Hari Ini",
                      style: mTitleStyle
                  ),
                ),
              ],
            )),

        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 65,
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
                    "X IPA 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Total Absen 32 Murid",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 65,
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
                    "X IPA 2",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                      "Fisika",
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight:  FontWeight.bold)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Total Absen 28 Murid",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
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