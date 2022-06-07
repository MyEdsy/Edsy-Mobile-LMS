import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:school_apps/components/bottom_navigation_siswa.dart';
import 'package:school_apps/screens/features/siswa/home/siswa_screens.dart';
import 'package:school_apps/screens/features/siswa/profile/profile_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/server/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../main.dart';
import 'jadwal_pelajaran_siswa/jadwal_pelajaran_guru_screen.dart';
import 'keuangan/Screens/MenuKeuanganScreens.dart';
import 'menu_pembelajaran_siswa/menu_pembelajaran_screens.dart';

class HomeSiswa extends StatefulWidget {
  static String routeName = "/home_menu_siswa";

  @override
  _HomeSiswa createState() => _HomeSiswa();
}

class _HomeSiswa extends State<HomeSiswa> {
  var isLoading = false, showNavi = false;
  var responseJson, dataTahunAjaran;
  var status, code;

  var data = jsonDecode(dataUserLogin);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _selectedIndex;
  var lastIndex;
  var args;

  getCurrentPage(int index) {
    if (index == 0) {
      return SiswaScreen();
    } else if (index == 1) {
      return MenuPembelajaranSiswa();
    } else if (index == 2) {
      // return JadwalPelajaranSiswa();
      return MenuKeuanganScreens();
    } else if (index == 3) {
      return ProfileSiswaScreen();
    } else {}
  }

  _getDataUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dataUserLogin = sharedPreferences.getString("dataUser");
    tahunAjaranPref = sharedPreferences.getString("tahunAjaran");
    dataBaseUrl = sharedPreferences.getString("dataBaseUrl");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments;
        if (args != null) {
          // int to = args['to'];
          _selectedIndex = args['to'];
        }
      });
    });
    setState(() {
      this._getDataUsers();
      // getData();
      _selectedIndex = 0;
    });
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Beranda",
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.book),
        title: ("Pembelajaran"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_today_outlined),
        title: ("Keuangan"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
          key: _scaffoldKey,
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: <Widget>[
                    getCurrentPage(_selectedIndex),
                  ],
                ),
          bottomNavigationBar:
              BottomNavigationSiswa(_selectedIndex, onTabChange: (index) {
            _selectedIndex = index;
            setState(() {});
            if (_selectedIndex == 3 && _selectedIndex == lastIndex) {}
            lastIndex = index;
          }),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    exit(0);
  }

  Future<String> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'x-access-token': data['access_token'],
      'username': data['username']
    };
    try {
      final response = await http.get("${tahunAjaran}", headers: headers);
      responseJson = json.decode(response.body);
      // Future.delayed(Duration(seconds: 2)).then((value) {
      //   utilsApps.hideDialog(context);
      // });
      setState(() {
        isLoading = false;
        status = responseJson['status'];
        code = responseJson['code'];
        if (status == true && code == 200) {
          dataTahunAjaran = responseJson['result'];
          sharedPreferences.setString(
              'tahunAjaran', jsonEncode(dataTahunAjaran));
          sharedPreferences.commit();
          // Navigator.pushNamed(context, HomeGuru.routeName);
        } else if (status == false && code == 403) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['message'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.check,
                  onDissmissCallback: (type) {
                    //SignInScreen
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeSiswa.routeName, (r) => false);
                    // Navigator.pushNamed(
                    //     context, SignInScreen.routeName);
                  },
                  btnOkColor: kColorYellow)
              .show();
        } else {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: "Sesi anda telah habis, mohon login kembali",
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  onDissmissCallback: (type) async {
                    //SignInScreen
                    Navigator.pushNamedAndRemoveUntil(
                        context, SignInScreen.routeName, (r) => false);
                    final pref = await SharedPreferences.getInstance();
                    await pref.clear();
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Tidak dapat terhububg ke server",
                btnOkOnPress: () {},
                btnOkIcon: Icons.cancel,
                onDissmissCallback: (type) async {
                  //SignInScreen
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeSiswa.routeName, (r) => false);
                },
                btnOkColor: kColorRedSlow)
            .show();
      });
    }

    return 'success';
  }
}
