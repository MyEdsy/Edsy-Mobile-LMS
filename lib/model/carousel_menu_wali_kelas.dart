class CarouselWaliKelasModel {
  String image;

  CarouselWaliKelasModel(this.image);
}

List<CarouselWaliKelasModel> carousels =
carouselsData.map((item) => CarouselWaliKelasModel(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/back_ground_banner.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
