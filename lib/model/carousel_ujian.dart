class CarouselUjian {
  String image;

  CarouselUjian(this.image);
}

List<CarouselUjian> carousels =
carouselsData.map((item) => CarouselUjian(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/2396.jpg"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
