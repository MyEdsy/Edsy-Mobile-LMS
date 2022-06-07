class MasterKomponenNilai {
  final String idkompnilai;
  final String nama_komponen;

  MasterKomponenNilai({required this.idkompnilai, required this.nama_komponen});

  factory MasterKomponenNilai.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return MasterKomponenNilai(
        idkompnilai: "kosong",
        nama_komponen: "kosong",
      );
    }
    // var dataJson = json['result'];
    // print(dataJson);
    return MasterKomponenNilai(
      idkompnilai: '${json["idkompnilai"]}',
      nama_komponen: json["nama_komponen"],
    );
  }

  static List<MasterKomponenNilai>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => MasterKomponenNilai.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.idkompnilai} ${this.nama_komponen}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this?.createdAt?.toString()?.contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(MasterKomponenNilai model) {
    return this.idkompnilai == model.idkompnilai;
  }

  @override
  String toString() => nama_komponen;
}
