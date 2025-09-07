import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/main/domain/entity/main_view_entity.dart';

import 'DashboardActionButton.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key, required this.mainViewEntity});
  final MainViewEntity mainViewEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   child: Row(
        //     children: List.generate(
        //       dashboardActionButtonList.length,
        //       (index) => Expanded(
        //         child: DashboardActionButton(
        //           dashboardActionButtonModel: dashboardActionButtonList[index],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: DashboardActionButton(
                  number: mainViewEntity.ordersCount.toString(),
                  title: "All Orders",
                ),
              ),
              Expanded(
                child: DashboardActionButton(
                  number: mainViewEntity.rentalCount.toString(),
                  title: "Rental Devices",
                ),
              ),
              Expanded(
                child: DashboardActionButton(
                  number: mainViewEntity.maintainanceCount.toString(),
                  title: "Maintain Dev",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
