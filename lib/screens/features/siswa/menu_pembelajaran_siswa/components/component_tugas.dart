import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constants.dart';

class TugasSiswa extends StatefulWidget {
  @override
  _Tugas createState() => _Tugas();
}

class _Tugas extends State<TugasSiswa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16, top: 10, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(text: "Tugas", style: mTitleStyle, children: [
                    TextSpan(
                      text: "(3)",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Text(
                    "Lihat Semua",
                    style: mServiceSeeAll,
                  ),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            // padding: EdgeInsets.all(10),
            height: 110,
            decoration: BoxDecoration(
              // color: mFillColor,
              // borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: mBorderColor, width: 1)
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildTaskItem(1, "Matematika", Colors.red),
                  buildTaskItem(3, "Fisika", Colors.green),
                  buildTaskItem(2, "Geografi", Colors.amber),
                ],
              ),
            ))
      ],
    );
  }

  Container buildTaskItem(int numDays, String courseTitle, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Batas Pengerjaan",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$numDays hari lagi",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
