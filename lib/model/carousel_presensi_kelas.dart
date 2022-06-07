class CarouselModelPresensiKelas {
  String image;

  CarouselModelPresensiKelas(this.image);
}

List<CarouselModelPresensiKelas> carousels =
carouselsData.map((item) => CarouselModelPresensiKelas(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/absent_menu.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
