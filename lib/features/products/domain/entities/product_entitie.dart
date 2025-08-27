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
  final String qrCode;
  final List<String> imagesUrl;
  final List<VedioEntity> vedios;

  ProductEntity({
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
    nameEn: "Device 1",
    nameAr: "",
    categoryEn: "Category 1",
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
      "https://png.pngtree.com/png-clipart/20250127/original/pngtree-medical-ultrasound-machine-diagnostic-equipment-png-image_20349325.png",
    ],
    vedios: [],
  ),
  ProductEntity(
    id: 2,
    nameEn: "Device 1",
    nameAr: "",
    categoryEn: "Category 1",
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
      "https://png.pngtree.com/png-clipart/20250127/original/pngtree-medical-ultrasound-machine-diagnostic-equipment-png-image_20349325.png",
    ],
    vedios: [],
  ),
  ProductEntity(
    id: 3,
    nameEn: "Device 1",
    nameAr: "",
    categoryEn: "Category 1",
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
      "https://png.pngtree.com/png-clipart/20250127/original/pngtree-medical-ultrasound-machine-diagnostic-equipment-png-image_20349325.png",
    ],
    vedios: [],
  ),
  ProductEntity(
    id: 4,
    nameEn: "Device 1",
    nameAr: "",
    categoryEn: "Category 1",
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
      "https://png.pngtree.com/png-clipart/20250127/original/pngtree-medical-ultrasound-machine-diagnostic-equipment-png-image_20349325.png",
    ],
    vedios: [],
  ),
];
