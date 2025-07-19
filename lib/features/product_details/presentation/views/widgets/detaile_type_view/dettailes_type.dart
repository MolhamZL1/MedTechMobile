import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class DettailesType extends StatelessWidget {
  const DettailesType({super.key, required this.text, required this.selected});
  final String text;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SelectedDettailesType(text: text),
      secondChild: NotSelectedDettailesType(text: text),
      crossFadeState:
          selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Durations.short4,
    );
  }
}

class NotSelectedDettailesType extends StatelessWidget {
  const NotSelectedDettailesType({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.formcolor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(child: Text(text,
       style: TextStyle(color: Colors.blueGrey,fontSize: 15))),
    );
  }
}

class SelectedDettailesType extends StatelessWidget {
  const SelectedDettailesType({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(child: Text(text,
       style: TextStyle(color: Colors.white,
       fontSize: 15))),
    );
  }
}

