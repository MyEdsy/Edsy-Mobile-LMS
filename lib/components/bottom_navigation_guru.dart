import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class BottomNavigationGuru extends StatefulWidget {
  var _currentIndex = 0;
  Function onTabChange;

  BottomNavigationGuru(this._currentIndex, {Key? key, required this.onTabChange}) : super(key: key);

  @override
  _BottomNavigationGuru createState() => _BottomNavigationGuru();
}

class _BottomNavigationGuru extends State<BottomNavigationGuru> {
  // int _selectedIndex = 0;

  // var bottomTextStyle =
  // GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      widget._currentIndex = index;
      widget.onTabChange(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget._currentIndex == 0
                ? new SvgPicture.asset('assets/icons/home_colored.svg')
                : new SvgPicture.asset('assets/icons/home.svg'),
            // title: Text('Home',
            //     style: widget._currentIndex == 0
            //         ? TextStyle(color: kPrimaryColor)
            //         : TextStyle(color: mSubtitleColor)),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 1
                ? new SvgPicture.asset('assets/icons/order_colored.svg')
                : new SvgPicture.asset('assets/icons/order.svg'),
            // title: Text(
            //   'Pembelajaran',
            //   style: widget._currentIndex == 1
            //       ? TextStyle(color: kPrimaryColor)
            //       : TextStyle(color: mSubtitleColor),
            // ),
              label: "Pembelajaran"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 2
                ? new SvgPicture.asset('assets/icons/watch_colored.svg')
                : new SvgPicture.asset('assets/icons/watch.svg'),
            // title: Text('Jadwal',
            //     // style: bottomTextStyle,
            //     style: widget._currentIndex == 2
            //         ? TextStyle(color: kPrimaryColor)
            //         : TextStyle(color: mSubtitleColor)),
              label: "Jadwal"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 3
                ? new SvgPicture.asset('assets/icons/account_colored.svg')
                : new SvgPicture.asset('assets/icons/account.svg'),
            // title: Text('Akun',
            //     style: widget._currentIndex == 3
            //         ? TextStyle(color: kPrimaryColor)
            //         : TextStyle(color: mSubtitleColor)),
            label: "Akun"
          ),
        ],
        currentIndex: widget._currentIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
        showSelectedLabels: true,
      ),

      // child: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.blueGrey,
      //   currentIndex: widget._currentIndex,
      //   onTap: _onItemTapped,
      //   // ignore: prefer_const_literals_to_create_immutables
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.upload), label: "Post"),
      //     // BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person), label: "Accounts"),
      //   ],
      // ),
    );
  }
}
