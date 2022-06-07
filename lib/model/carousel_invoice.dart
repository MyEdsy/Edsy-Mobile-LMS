class CarouselInvoiceModel {
  String image;

  CarouselInvoiceModel(this.image);
}

List<CarouselInvoiceModel> carousels =
carouselsData.map((item) => CarouselInvoiceModel(item['image'].toString())).toList();

var carouselsData = [
  {"image": "assets/images/invoice-.png"},
  // {"image": "assets/images/banner_b.png"},
  // {"image": "assets/images/banner_c.png"},
  // {"image": "assets/images/banner_d.png"},
  // {"image": "assets/images/banner_e.png"},
  // {"image": "assets/images/banner_f.png"},
];
