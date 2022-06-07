class CarouselModeltidakAdaJadwal {
  String image;

  CarouselModeltidakAdaJadwal(this.image);
}

List<CarouselModeltidakAdaJadwal> carousels =
carouselsData.map((item) => CarouselModeltidakAdaJadwal(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/no_jadwal.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
