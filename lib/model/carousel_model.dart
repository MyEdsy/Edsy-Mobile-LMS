class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/ban_1.png"},
  {"image": "assets/images/ban_2.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
