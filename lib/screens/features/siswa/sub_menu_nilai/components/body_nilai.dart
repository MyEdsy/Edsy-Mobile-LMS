import 'package:flutter/widgets.dart';

class BodyNilaiSiswa extends StatefulWidget {
  @override
  _BodyNilaiSiswa createState() => _BodyNilaiSiswa();
}

class _BodyNilaiSiswa extends State<BodyNilaiSiswa> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // Promos Section
          SizedBox(
            height: 5,
          ),
          // DetailNilaiSiswa(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}