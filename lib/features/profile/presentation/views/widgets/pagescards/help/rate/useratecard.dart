import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/ratecards.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/starsrow.dart';

class Useratecard extends StatelessWidget {
  const Useratecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Ratecards(text: 'سهولة الاستخدام');
  }
}
