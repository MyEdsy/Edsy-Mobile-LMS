import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';

class PilihanGanda extends StatelessWidget {
  const PilihanGanda({
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
          children: [
            // SizedBox(width: 20),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: pilihan,
                    style: TextStyle(
                      // fontSize: 12,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: text,
                        style: TextStyle(
                          // fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
