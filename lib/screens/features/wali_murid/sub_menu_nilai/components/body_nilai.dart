import 'package:flutter/widgets.dart';

class WaliMuridBodyNilaiSiswa extends StatefulWidget {
  const WaliMuridBodyNilaiSiswa({Key? key}) : super(key: key);

  @override
  _WaliMuridBodyNilaiSiswa createState() => _WaliMuridBodyNilaiSiswa();
}

class _WaliMuridBodyNilaiSiswa extends State<WaliMuridBodyNilaiSiswa> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: const <Widget>[
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