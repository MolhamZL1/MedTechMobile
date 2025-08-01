import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/ratecards.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/starsrow.dart';

class Geniralrate extends StatelessWidget {
  const Geniralrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Ratecards(text: 'التقييم العام ');
  }
}
