class ProductEntity {
  final num id;

  final String nameEn;
  final String nameAr;
  final String categoryEn;
  final String categoryAr;
  final String companyEn;
  final String companyAr;
  final String descriptionEn;
  final String descriptionAr;
  final num rentStock;
  final num saleStock;
  final num salePrice;
  final num rentalPrice;
  final num rate;
  final bool availableForRent;
  final bool availableForSale;
  final String qrCode;
  final List<String> imagesUrl;
  final List<String> vedioUrls;

  ProductEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.categoryEn,
    required this.categoryAr,
    required this.companyEn,
    required this.companyAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.rentStock,
    required this.saleStock,
    required this.salePrice,
    required this.rentalPrice,
    required this.rate,
    required this.availableForRent,
    required this.availableForSale,
    required this.qrCode,
    required this.imagesUrl,
    required this.vedioUrls,
  });
}
