import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../constants.dart';
import '../detail_tugas_screens.dart';
import '../playVideoYoutube.dart';
import 'components_detail_tugas.dart';

class BodyDetailTugas extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<BodyDetailTugas> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Tugas : ${DetailTugas.dataTugasFromDetailTugas['nama_tugas'] ?? '-'}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Text(
                "Keterangan Tugas : ${DetailTugas.dataTugasFromDetailTugas['keterangan'] ?? '-'}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              DetailTugas.dataTugasFromDetailTugas['link_youtube'] == null
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PlayVideoDetailTugas.routeName,
                            arguments: DetailTugas.dataTugasFromDetailTugas);
                      },
                      child: const Chip(
                        backgroundColor: kColorBlue,
                        label: Text(
                          "Lihat video Youtube",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
              DetailTugas.dataTugasFromDetailTugas['link_sumberlain'] == null
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        _launchInBrowser(
                            '${DetailTugas.dataTugasFromDetailTugas['link_sumberlain']}');
                      },
                      child: const Chip(
                        backgroundColor: kColorBlue,
                        label: Text(
                          "Lihat Dari Sumber Lain",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
              Text(
                "Tanggal Mulai : ${DetailTugas.dataTugasFromDetailTugas['tgl_mulai'] ?? '-'}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Text(
                "Status Pengerjaan : ${DetailTugas.dataTugasFromDetailTugas['status'] ?? '-'}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tipe Soal :",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ComponentDetailTugas()
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
