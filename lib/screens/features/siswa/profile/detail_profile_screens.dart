import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_apps/constants.dart';
import 'package:school_apps/screens/features/siswa/profile/biodata.dart';
import 'package:school_apps/screens/features/siswa/profile/ubah_password.dart';

class DetailProfileSiswaScreen extends StatefulWidget {
  static String routeName = "/detail_profile_siswa";

  const DetailProfileSiswaScreen({Key? key}) : super(key: key);
  @override
  _DetailProfileSiswaScreen createState() => _DetailProfileSiswaScreen();
}


class _DetailProfileSiswaScreen extends State<DetailProfileSiswaScreen> with SingleTickerProviderStateMixin{

  //create controller untuk tabBar
  late TabController controller;

  @override

  void initState(){
    controller = new TabController(vsync: this, length: 2);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        //warna background
        backgroundColor: kPrimaryColor,
        //judul
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: new Text("My Account"),
        //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(FontAwesomeIcons.user),),
            new Tab(icon: new Icon(FontAwesomeIcons.lock),),
          ],
        ),
      ),

      //source code lanjutan
      //buat body untuk tab viewnya
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new Biodata(),
          new UbahPassword()
        ],
      ),
    );
  }
}
