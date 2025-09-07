import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/NaivgationBarItem.dart';

import 'bottom_navigation_bar_entity.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: buildNavBarDecoration(context),
      child: Row(
        children: List.generate(bottomNavigationBarItems.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<NavBarCubit>().changeIndex(index);
              },
              child: NaivgationBarItem(
                bottomNavigationBarEntity: bottomNavigationBarItems[index],
                isSelected: context.watch<NavBarCubit>().currentIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }

  BoxDecoration buildNavBarDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Color(0xff202020)
              : Colors.white,
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
