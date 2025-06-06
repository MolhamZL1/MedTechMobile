import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class AppBars extends AppBar {
  AppBars()
    : super(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.primary,
        title: Text(
          "Reset PassWord ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () => null),
          IconButton(icon: Icon(Icons.person), onPressed: () => null),
        ],
      );
}
