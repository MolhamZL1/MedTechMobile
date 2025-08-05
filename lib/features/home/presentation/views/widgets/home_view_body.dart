import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
          trailing: Image.asset(AppImages.imagesMedtechlogo),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Quick Access",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(
          children: [
            Container(
              child: Column(
                children: [Icon(Icons.calendar_today_outlined), Text("Rent")],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
