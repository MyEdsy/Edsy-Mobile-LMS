
class KomponenNilai {
  final String id;
  final String nama_komponen;
  final String type;
  final String bobot;
  final String nip;
  final String kode_mapel;
  final String tahun;
  final String semester;
  final String idKelKelas;


  KomponenNilai(
      {required this.id,
      required this.nama_komponen,
      required this.type,
      required this.bobot,
      required this.nip,
      required this.kode_mapel,
      required this.tahun,
      required this.semester,
      required this.idKelKelas});

  factory KomponenNilai.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return KomponenNilai(
          id: "kosong",
          nama_komponen: "kosong",
          type: "kosong",
          bobot: "kosong",
          nip: "kosong",
          kode_mapel: "kosong",
          tahun: "kosong",
          semester: "kosong",
          idKelKelas: "kosong");
    }
    // var dataJson = json['result'];
    // print(dataJson);
    return KomponenNilai(
        id: '${json["id"]}',
        nama_komponen: json["nama_komponen"],
        type: json["type"],
        bobot: '${json["bobot"]}',
        nip: json["nip"],
        kode_mapel: '${json["kode_mapel"]}',
        tahun: '${json["tahun"]}',
        semester: json["semester"],
        idKelKelas: '${json["idkelompokkls"]}');
  }

  static List<KomponenNilai>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => KomponenNilai.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.nama_komponen}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this?.createdAt?.toString()?.contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(KomponenNilai model) {
    return this.id == model.id;
  }

  @override
  String toString() => nama_komponen;
}
