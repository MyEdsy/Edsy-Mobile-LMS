class CarouselJadwalModel {
  String image;

  CarouselJadwalModel(this.image);
}

List<CarouselJadwalModel> carousels =
carouselsData.map((item) => CarouselJadwalModel(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/jadwal_banner.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
