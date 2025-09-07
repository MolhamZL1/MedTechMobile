import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/widgets/CustomLoadingCircle.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/cubit/fetch_main_view_cubit.dart';

import '../../../../main/presentaion/cubits/nav_bar/nav_bar_cubit.dart';
import '../../../../main/presentaion/views/widgets/offers_list.dart';
import 'ActionButtonSection.dart';
import 'FEaturedProductsRow.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMainViewCubit, FetchMainViewState>(
      builder: (context, state) {
        if (state is FetchMainViewFialure) {
          return Center(child: Text(state.errMessage));
        } else if (state is FetchMainViewSucces) {
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
                ActionButtonSection(mainViewEntity: state.mainViewEntity),
                SizedBox(height: 15),
                AutoOfferCarousel(
                  slides: List.generate(
                    state.mainViewEntity.advs.length,
                    (index) =>
                        OfferSlide(advEntity: state.mainViewEntity.advs[index]),
                  ),
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
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),

                FEaturedProductsRow(
                  products: state.mainViewEntity.featuredProducts,
                ),
              ],
            ),
          );
        } else {
          return const CustomLoadingCircle();
        }
      },
    );
  }
}
