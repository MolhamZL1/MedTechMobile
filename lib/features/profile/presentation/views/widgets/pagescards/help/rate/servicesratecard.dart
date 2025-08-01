import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/ratecards.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/starsrow.dart';

class Servicesratecard extends StatelessWidget {
  const Servicesratecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Ratecards(text: 'خدمة العملاء');
  }
}
