import 'package:flutter/material.dart';

import '../../../data/models/DashboardActionButtonModel.dart';
import 'DashboardActionButton.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
