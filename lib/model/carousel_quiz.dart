class Carouselquiz {
  String image;

  Carouselquiz(this.image);
}

List<Carouselquiz> carousels =
carouselsData.map((item) => Carouselquiz(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/5161952.jpg"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
