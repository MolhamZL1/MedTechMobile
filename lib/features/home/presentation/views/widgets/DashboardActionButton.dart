import 'package:flutter/material.dart';

import '../../../data/models/DashboardActionButtonModel.dart';

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
