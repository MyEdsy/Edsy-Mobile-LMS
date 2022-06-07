import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';

class PilihanGandaHtml extends StatelessWidget {
  const PilihanGandaHtml({
    Key? key,
    // required this.jawaban,
    // required this.jawabanBenar,
    required this.pilihan,
    required this.text,
    required this.color,
    required this.textColor,
    required this.press,
  }) : super(key: key);

  final String text, pilihan;
  // jawaban, jawabanBenar;
  final Color color, textColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(width: 20),
            // RichText(
            //   text: TextSpan(
            //     text: pilihan,
            //     style: TextStyle(
            //       // fontSize: 12,
            //         color: textColor,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            Text(pilihan,  style: TextStyle(
              // fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.bold),),
            Expanded(child: Html(data: text, style: {
              // p tag with text_size
              "p": Style(
                color: textColor,
              ),
            },)),
          ],
        ),
      ),
    );
  }
}