import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/CustomNavigationBar.dart';

import 'widgets/MainViewBody.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(child: MainViewBody(selectedIndex: currentIndex)),
    );
  }
}
