import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

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
