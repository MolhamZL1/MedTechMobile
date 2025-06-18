import 'package:flutter/material.dart';

import 'ActiveNavigationBarItem.dart';
import 'InActiveNavigationBarItem.dart';
import 'bottom_navigation_bar_entity.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCrossFade(
        // secondCurve: Easing.legacy,
        // firstCurve: Easing.legacy,
        firstChild: ActiveNavigationBarItem(
          image: bottomNavigationBarEntity.activeImage,
          text: bottomNavigationBarEntity.name,
        ),
        secondChild: InActiveNavigationBarItem(
          image: bottomNavigationBarEntity.inActiveImage,
        ),
        crossFadeState:
            isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Durations.medium2,
      ),
    );
  }
}
