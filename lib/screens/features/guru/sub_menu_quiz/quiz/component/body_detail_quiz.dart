import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/component/components_detail_quiz.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../constants.dart';
import '../detail_quiz_screens.dart';
import '../playVideoYoutube.dart';

class BodyDetailQuiz extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyDetailQuiz> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                "Keterangan Quiz :",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Text(
                '${DetailQuiz.dataTugasFromDetailTugas['keterangan']}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: kPrimaryColor),
              ),
              DetailQuiz.dataTugasFromDetailTugas['link_youtube'] == null
                  ? Container()
                  : GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, PlayVideoDetailQuiz.routeName,
                      arguments: DetailQuiz.dataTugasFromDetailTugas);
                },
                child: Chip(
                  backgroundColor: kColorBlue,
                  label: Text(
                    "Lihat video Youtube",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              DetailQuiz.dataTugasFromDetailTugas['link_sumberlain'] == null
                  ? Container()
                  : GestureDetector(
                onTap: () {
                  _launchInBrowser('${DetailQuiz.dataTugasFromDetailTugas['link_sumberlain']}');
                },
                child: Chip(
                  backgroundColor: kColorBlue,
                  label: Text(
                    "Lihat Dari Sumber Lain",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 12,
        ),
        ComponentDetailQuiz()
        // KategoriNilai()
      ],
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
