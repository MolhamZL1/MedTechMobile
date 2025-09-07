import 'package:medtech_mobile/features/main/domain/entity/adv_entity.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class MainViewEntity {
  final List<AdvEntity> advs;
  final List<ProductEntity> featuredProducts;
  final num ordersCount;
  final num rentalCount;
  final num maintainanceCount;

  MainViewEntity({
    required this.featuredProducts,
    required this.ordersCount,
    required this.rentalCount,
    required this.maintainanceCount,
    required this.advs,
  });
}
