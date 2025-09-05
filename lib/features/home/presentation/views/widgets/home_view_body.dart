import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

import '../../../../main/presentaion/cubits/cubit/nav_bar_cubit.dart';
import '../../../../main/presentaion/views/widgets/offers_list.dart';
import 'ActionButtonSection.dart';
import 'FEaturedProductsRow.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                child: Icon(
                  Icons.notifications_active,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       "Quick Access",
          //       style: Theme.of(context).textTheme.titleMedium,
          //     ),
          //   ),
          // ),
          ActionButtonSection(),
          SizedBox(height: 15),
          AutoOfferCarousel(
            slides: [
              const OfferSlide(
                imageUrl:
                    "http://10.0.2.2:8383/uploads/images/1755632051655-595297845.png",
                title: "Ultrasound Week",
                subtitle: "Save up to 30%",
              ),
              const OfferSlide(
                imageUrl:
                    "https://images.unsplash.com/photo-1584982751601-97dcc096659c",
                title: "Consumables bundle",
                subtitle: "Buy 3 get 1 free",
              ),
              const OfferSlide(
                imageUrl:
                    "https://images.unsplash.com/photo-1581091012184-7c54a6c2b3d5",
                title: "Rental discounts",
                subtitle: "Short-term deals",
              ),
              const OfferSlide(
                imageUrl:
                    "https://images.unsplash.com/photo-1581091012184-7c54a6c2b3d5",
                title: "Rental discounts",
                subtitle: "Short-term deals",
              ),
            ],
          ),
          SizedBox(height: 10),
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

          FEaturedProductsRow(),
        ],
      ),
    );
  }
}
