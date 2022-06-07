import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';


class ProfileName extends StatelessWidget {
  const ProfileName({
    Key? key,
    required this.text,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String text, icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Text(title, style: mTitleStyle),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: kPrimaryColor,
              padding: EdgeInsets.all(10),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: press,
            child: Row(
              children: [
                // SvgPicture.asset(
                //   icon,
                //   color: kPrimaryColor,
                //   width: 22,
                // ),
                SizedBox(width: 20),
                Expanded(child: Text(text)),
                // Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        )
      ],
    );
  }
}
