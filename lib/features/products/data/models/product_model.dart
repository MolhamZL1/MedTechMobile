import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/product_entitie.dart';
import '../../domain/entities/vedio_entity.dart';
import 'vedio_model.dart';

class ProductModel {
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
  final bool availableForRent;
  final bool availableForSale;
  final bool isFavorite;
  final String qrCode;
  final List<String> imagesUrl;
  final num rate;
  final List<VedioModel> videos;

  ProductModel({
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
    required this.availableForRent,
    required this.availableForSale,
    required this.qrCode,
    required this.imagesUrl,
    required this.rate,
    required this.videos,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] ?? 0,
    nameEn: json["nameEn"] ?? "",
    nameAr: json["nameAr"] ?? "",
    categoryEn: json["category"] ?? "",
    //categoryAr: json["categoryAr"],
    companyEn: json["company"] ?? "",
    //companyAr: json["companyAr"],
    descriptionEn: json["description"] ?? "",
    //descriptionAr: json["descriptionAr"],
    rate: json["rate"] ?? 0,
    rentalPrice: json["rentPrice"] ?? 0,
    salePrice: json["sellPrice"] ?? 0,
    availableForRent: json["availableForRent"] ?? false,
    availableForSale: json["availableForSale"] ?? false,
    rentStock: json["rentStock"] ?? 0,
    saleStock: json["saleStock"] ?? 0,
    qrCode: json["qrCode"] ?? "",
    imagesUrl: List<String>.from(
      (json["images"] as List<dynamic>?)?.cast<String>() ?? [],
    ),
    videos: List<VedioModel>.from(
      (json["videos"] as List<dynamic>?)?.map((x) => VedioModel.fromJson(x)) ??
          [],
    ),
    isFavorite: json["isFavorite"] ?? false,
  );

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
    id: entity.id,
    nameEn: entity.nameEn,
    nameAr: entity.nameAr,
    categoryEn: entity.categoryEn,
    categoryAr: entity.categoryAr,
    companyEn: entity.companyEn,
    companyAr: entity.companyAr,
    descriptionEn: entity.descriptionEn,
    descriptionAr: entity.descriptionAr,
    rate: entity.rate,
    rentalPrice: entity.rentalPrice,
    salePrice: entity.salePrice,
    availableForRent: entity.availableForRent,
    availableForSale: entity.availableForSale,
    rentStock: entity.rentStock,
    saleStock: entity.saleStock,
    qrCode: entity.qrCode,
    imagesUrl: entity.imagesUrl,
    videos: List<VedioModel>.from(
      entity.vedios.map((x) => VedioModel.fromEntity(x)),
    ),
    isFavorite: entity.isFavorite,
  );

  Map<String, dynamic> toJson() => {
    "nameEn": nameEn,
    "nameAr": nameAr,
    "category": categoryEn,
    //"categoryAr": categoryAr,
    "company": companyEn,
    //"companyAr": companyAr,
    "description": descriptionEn,

    //"descriptionAr": descriptionAr,
    "rentPrice": rentalPrice,
    "sellPrice": salePrice,
    "availableForRent": availableForRent,
    "availableForSale": availableForSale,
    "rentStock": rentStock,
    "saleStock": saleStock,
    "qrCode": qrCode,
    "images": List<dynamic>.from(imagesUrl.map((x) => x)),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "isFavorite": isFavorite,
  };
  toEntity() => ProductEntity(
    id: id,
    nameEn: nameEn,
    nameAr: nameAr,
    categoryEn: categoryEn,
    categoryAr: categoryAr,
    companyEn: companyEn,
    companyAr: companyAr,
    descriptionEn: descriptionEn,
    descriptionAr: descriptionAr,
    rate: rate,
    rentalPrice: rentalPrice,
    salePrice: salePrice,
    availableForRent: availableForRent,
    availableForSale: availableForSale,
    rentStock: rentStock,
    saleStock: saleStock,
    qrCode: qrCode,
    imagesUrl: imagesUrl.map((url) => "${BackendEndpoints.url}$url").toList(),
    vedios: List<VedioEntity>.from(videos.map((x) => x.toEntity())),
    isFavorite: isFavorite,
  );
}
