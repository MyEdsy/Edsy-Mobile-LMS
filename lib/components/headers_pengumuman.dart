import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:school_apps/model/carousel_model.dart';

import '../../../../constants.dart';

class HeadersForPengumuman extends StatefulWidget {
  final String menu;
  HeadersForPengumuman(this.menu, {Key? key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<HeadersForPengumuman> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          width: 260,
          child: Text(widget.menu,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: mTitleStyleNameApps),
        )
      ],
    );
  }
}
