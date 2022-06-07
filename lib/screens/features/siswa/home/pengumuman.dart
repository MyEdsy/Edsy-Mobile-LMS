import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:school_apps/components/headers_pengumuman.dart';
import 'package:school_apps/screens/features/guru/home_guru.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';

import '../../../../constants.dart';

class DetailPengumumanSiswa extends StatefulWidget {
  static String routeName = "/pengumuman_siswa";
  @override
  State createState() => _DetailPengumumanSiswa();
}

class _DetailPengumumanSiswa extends State<DetailPengumumanSiswa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getEffect();
  }

  @override
  Widget build(BuildContext context) {
    // getEffect();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        // Setting up AppBar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.blueGrey,
            onPressed: () {
              _onBackPressed();
            },
          ),
          automaticallyImplyLeading: false,
          title: HeadersForPengumuman(args['judul']),
          elevation: 0,
        ),
        backgroundColor: mBackgroundColor,
        // body: isLoading ? buildEffect() : Body()
        body: Container(
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              // Promos Section
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  args['judul'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: mTitleStyle16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Html(data: args['isi_pengumuman'])
              // Tugas(),
              // SizedBox(
              //   height: 12,
              // ),
            ],
          ),
        ));
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeSiswa()),
    );
    return Future.value(true);
  }
}
