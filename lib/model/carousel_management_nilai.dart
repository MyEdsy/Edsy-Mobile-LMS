class CarouselModelManageNilai {
  String image;

  CarouselModelManageNilai(this.image);
}

List<CarouselModelManageNilai> carousels =
carouselsData.map((item) => CarouselModelManageNilai(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/banner_management_nilai.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
