import 'vedio_entity.dart';

class ProductEntity {
  final num id;

  final String nameEn;
  final String nameAr;
  final String categoryEn;
  final String? categoryAr;
  final String companyEn;
  final String? companyAr;
  final String descriptionEn;
  final String? descriptionAr;
  final num rentStock;
  final num saleStock;
  final num salePrice;
  final num rentalPrice;
  final num rate;
  final bool availableForRent;
  final bool availableForSale;
  final bool isFavorite;
  final String qrCode;
  final List<String> imagesUrl;
  final List<VedioEntity> vedios;

  ProductEntity({
    required this.isFavorite,
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.categoryEn,
    this.categoryAr,
    required this.companyEn,
    this.companyAr,
    required this.descriptionEn,
    this.descriptionAr,
    required this.rentStock,
    required this.saleStock,
    required this.salePrice,
    required this.rentalPrice,
    required this.rate,
    required this.availableForRent,
    required this.availableForSale,
    required this.qrCode,
    required this.imagesUrl,
    required this.vedios,
  });
}

List<ProductEntity> featuredProducts = [
  ProductEntity(
    id: 1,
    nameEn: "Ultrasound Machine",
    nameAr: "",
    categoryEn: "Diagnostic Equipment",
    companyEn: "Company 1",
    descriptionEn: "This is a description of device 1",
    rentStock: 10,
    saleStock: 5,
    salePrice: 100,
    rentalPrice: 50,
    rate: 4.5,
    availableForRent: true,
    availableForSale: true,
    qrCode: "1234567890",
    imagesUrl: [
      "http://10.0.2.2:8383/uploads/images/1755632051655-595297845.png",
    ],
    vedios: [],
    isFavorite: false,
  ),
  ProductEntity(
    id: 2,
    nameEn: "MRI Machine",
    nameAr: "",
    categoryEn: "Diagnostic Equipment",
    companyEn: "Company 1",
    descriptionEn: "This is a description of device 1",
    rentStock: 10,
    saleStock: 5,
    salePrice: 100,
    rentalPrice: 50,
    rate: 4.5,
    availableForRent: true,
    availableForSale: true,
    qrCode: "1234567890",
    imagesUrl: [
      "http://10.0.2.2:8383/uploads/images/1755632051655-595297845.png",
    ],
    vedios: [],
    isFavorite: false,
  ),
  ProductEntity(
    id: 3,
    nameEn: "X-ray Machine",
    nameAr: "",
    categoryEn: "Diagnostic Equipment",
    companyEn: "Company 1",
    descriptionEn: "This is a description of device 1",
    rentStock: 10,
    saleStock: 5,
    salePrice: 100,
    rentalPrice: 50,
    rate: 4.5,
    availableForRent: true,
    availableForSale: true,
    qrCode: "1234567890",
    imagesUrl: [
      "http://10.0.2.2:8383/uploads/images/1755632051655-595297845.png",
    ],
    vedios: [],
    isFavorite: false,
  ),
  ProductEntity(
    id: 4,
    nameEn: "ECG Machine",
    nameAr: "",
    categoryEn: "Diagnostic Equipment",
    companyEn: "Company 1",
    descriptionEn: "This is a description of device 1",
    rentStock: 10,
    saleStock: 5,
    salePrice: 100,
    rentalPrice: 50,
    rate: 4.5,
    availableForRent: true,
    availableForSale: true,
    qrCode: "1234567890",
    imagesUrl: [
      "http://10.0.2.2:8383/uploads/images/1755632051655-595297845.png",
    ],
    vedios: [],
    isFavorite: false,
  ),
];
