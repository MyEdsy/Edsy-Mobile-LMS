class ModelMasterSekolah {
  final String kode_sekolah;
  final String nama_sekolah;
  final String base_url_api;
  final String base_url_lms;
  final String base_url_admin;

  ModelMasterSekolah({
    required this.kode_sekolah,
    required this.nama_sekolah,
    required this.base_url_api,
    required this.base_url_lms,
    required this.base_url_admin,
  });

  factory ModelMasterSekolah.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return ModelMasterSekolah(
        kode_sekolah: "kosong",
        nama_sekolah: "kosong",
        base_url_api: "kosong",
        base_url_lms: "kosong",
        base_url_admin: "kosong",
      );
    }
    // var dataJson = json['result'];
    // print(dataJson);
    return ModelMasterSekolah(
      kode_sekolah: json["kode_sekolah"],
      nama_sekolah: json["nama_sekolah"],
      base_url_api: json["base_url_api"],
      base_url_lms: json["base_url_lms"],
      base_url_admin: json["base_url_admin"],
    );
  }

  static List<ModelMasterSekolah>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ModelMasterSekolah.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '${this.kode_sekolah} ${this.nama_sekolah}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this?.createdAt?.toString()?.contains(filter);
  // }

  ///custom comparing function to check if two users are equal
  bool isEqual(ModelMasterSekolah model) {
    return this.kode_sekolah == model.kode_sekolah;
  }

  @override
  String toString() => nama_sekolah;
}
