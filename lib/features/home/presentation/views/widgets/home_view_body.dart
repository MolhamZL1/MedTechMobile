import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import '../../../../main/presentaion/cubits/cubit/nav_bar_cubit.dart';
import '../../../../products/presentation/views/widgets/product_card/product_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Welcome",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            subtitle: Text(
              "Discover the latest medical devices and services.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(.3),
              child: Transform.rotate(
                angle: 0.7,
                child: Icon(Icons.turn_sharp_right, color: AppColors.primary),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Quick Access",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: List.generate(
              dashboardActionButtonList.length,
              (index) => Expanded(
                child: DashboardActionButton(
                  dashboardActionButtonModel: dashboardActionButtonList[index],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(
              dashboardInfoActionButtonList.length,
              (index) => Expanded(
                child: DashboardActionButton(
                  dashboardActionButtonModel:
                      dashboardInfoActionButtonList[index],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<NavBarCubit>().changeIndex(1);
                },
                child: Text(
                  "View All >",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              final product = featuredProducts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 0.72,
                  child: CustomProductCard(productEntitie: product),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
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
    imagesUrl: [AppImages.imagesMedtechlogo],
    vedios: [],
  ),
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
    imagesUrl: [AppImages.imagesMedtechlogo],
    vedios: [],
  ),
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
    imagesUrl: [AppImages.imagesMedtechlogo],
    vedios: [],
  ),
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
    imagesUrl: [AppImages.imagesMedtechlogo],
    vedios: [],
  ),
];

class DashboardActionButtonModel {
  final Widget title;
  final String text;
  final VoidCallback onTap;

  DashboardActionButtonModel({
    required this.title,
    required this.text,
    required this.onTap,
  });
}

List<DashboardActionButtonModel> dashboardActionButtonList = [
  DashboardActionButtonModel(
    title: CircleAvatar(
      backgroundColor: AppColors.primary,
      child: Icon(Icons.calendar_today_outlined),
    ),
    text: "Rent",
    onTap: () {},
  ),
  DashboardActionButtonModel(
    title: CircleAvatar(
      backgroundColor: AppColors.primary,
      child: Icon(Icons.build_outlined),
    ),
    text: "Maintain",
    onTap: () {},
  ),
  DashboardActionButtonModel(
    title: CircleAvatar(
      backgroundColor: AppColors.primary,
      child: Icon(Icons.shopping_bag_outlined),
    ),

    text: "Shopping",
    onTap: () {},
  ),
];
List<DashboardActionButtonModel> dashboardInfoActionButtonList = [
  DashboardActionButtonModel(
    title: Text(
      "12",
      style: TextStyle(
        // لعناوين الكروت أو العناصر المهمة
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
    text: "All oreders",
    onTap: () {},
  ),
  DashboardActionButtonModel(
    title: Text(
      "8",
      style: TextStyle(
        // لعناوين الكروت أو العناصر المهمة
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
    text: "Maintain orders",
    onTap: () {},
  ),
  DashboardActionButtonModel(
    title: Text(
      "3",
      style: TextStyle(
        // لعناوين الكروت أو العناصر المهمة
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),

    text: "Rented orders",
    onTap: () {},
  ),
];

class DashboardActionButton extends StatelessWidget {
  const DashboardActionButton({
    super.key,
    required this.dashboardActionButtonModel,
  });
  final DashboardActionButtonModel dashboardActionButtonModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dashboardActionButtonModel.onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              dashboardActionButtonModel.title,
              SizedBox(height: 8),
              Text(
                dashboardActionButtonModel.text,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
