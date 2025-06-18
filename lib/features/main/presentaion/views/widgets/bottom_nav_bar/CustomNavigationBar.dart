import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/NaivgationBarItem.dart';

import 'bottom_navigation_bar_entity.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: buildNavBarDecoration(),
      child: Row(
        children: List.generate(bottomNavigationBarItems.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => currentIndex = index);
                widget.onChanged(currentIndex);
              },
              child: NaivgationBarItem(
                bottomNavigationBarEntity: bottomNavigationBarItems[index],
                isSelected: currentIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }

  BoxDecoration buildNavBarDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 25,
          offset: Offset(0, -2),
          spreadRadius: 0,
        ),
      ],
    );
  }
}
