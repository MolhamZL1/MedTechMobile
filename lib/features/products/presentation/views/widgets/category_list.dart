import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: CategoryItem(
              text: categories[index],
              selected: selectedIndex == index,
            ),
          ),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: categories.length,
    );
  }
}
