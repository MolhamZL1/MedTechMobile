import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveNavigationBarItem extends StatelessWidget {
  const InActiveNavigationBarItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, height: 20, color: Colors.black54);
  }
}
