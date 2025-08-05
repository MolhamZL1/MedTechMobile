import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/headerdesign/stateitem.dart';


class profileStats extends StatelessWidget {
  const profileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16,),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            StatItem(title: 'طلب', value: '24'),
            StatItem(title: 'تأخر', value: '3'),
            StatItem(title: 'تقييم', value: '4.8'),
          ],
        ),
      ),
    );
  }
}

