class CarouselKesiswaanModel {
  String image;

  CarouselKesiswaanModel(this.image);
}

List<CarouselKesiswaanModel> carousels = carouselsData
    .map((item) => CarouselKesiswaanModel(item['image'].toString()))
    .toList();

var carouselsData = [
  {"image": "assets/images/datapelanggaran.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
