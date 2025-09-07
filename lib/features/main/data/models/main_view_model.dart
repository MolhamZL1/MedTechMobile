import 'package:medtech_mobile/features/main/data/models/adv_model.dart';
import 'package:medtech_mobile/features/main/domain/entity/adv_entity.dart';
import 'package:medtech_mobile/features/main/domain/entity/main_view_entity.dart';
import 'package:medtech_mobile/features/products/data/models/product_model.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class MainViewModel {
  final List<AdvModel> advs;
  final List<ProductModel> featuredProducts;
  final num ordersCount;
  final num rentalCount;
  final num maintainanceCount;

  MainViewModel({
    required this.advs,
    required this.featuredProducts,
    required this.ordersCount,
    required this.rentalCount,
    required this.maintainanceCount,
  });

  factory MainViewModel.fromJson(Map<String, dynamic> json) => MainViewModel(
    advs: List<AdvModel>.from(
      json["advertisements"].map((x) => AdvModel.fromJson(x)),
    ),
    featuredProducts: List<ProductModel>.from(
      json["featuredProducts"].map((x) => ProductModel.fromJson(x)),
    ),
    ordersCount: json["userStats"]["totalOrders"],
    rentalCount: json["userStats"]["totalRentals"],
    maintainanceCount: json["userStats"]["totalMaintenance"],
  );
  MainViewEntity toEntity() => MainViewEntity(
    featuredProducts: List<ProductEntity>.from(
      featuredProducts.map((x) => x.toEntity()),
    ),
    ordersCount: ordersCount,
    rentalCount: rentalCount,
    maintainanceCount: maintainanceCount,
    advs: List<AdvEntity>.from(advs.map((x) => x.toEntity())),
  );
}
