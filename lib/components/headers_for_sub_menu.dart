import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:school_apps/model/carousel_model.dart';

import '../../../../constants.dart';

class HeadersForMenu extends StatefulWidget {
  final String menu;

  HeadersForMenu(this.menu, {Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<HeadersForMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(widget.menu, style: mTitleStyleNameApps),
      ],
    );
  }
}
