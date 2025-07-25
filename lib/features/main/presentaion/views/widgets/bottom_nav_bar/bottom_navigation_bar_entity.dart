import 'package:medtech_mobile/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String name;
  final String activeImage;
  final String inActiveImage;
  BottomNavigationBarEntity({
    required this.name,
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: AppImages.imagesHome,
    inActiveImage: AppImages.imagesHome,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.imagesProducts,
    inActiveImage: AppImages.imagesProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.imagesShoppingCart,
    inActiveImage: AppImages.imagesShoppingCart,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.imagesFavorite24dpE3E3E3FILL0Wght400GRAD0Opsz24,
    inActiveImage: AppImages.imagesFavorite24dpE3E3E3FILL0Wght400GRAD0Opsz24,
    name: "المفضلة",
  ),
  BottomNavigationBarEntity(
    activeImage: AppImages.imagesUser,
    inActiveImage: AppImages.imagesUser,
    name: 'حسابي',
  ),
];
