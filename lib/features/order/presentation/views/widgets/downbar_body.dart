import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/downbar.dart';

class DownbarBody extends StatefulWidget {
  const DownbarBody({super.key});

  @override
  State<DownbarBody> createState() => _DownbarBodyState();
}

class _DownbarBodyState extends State<DownbarBody> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return  Row(
                    children:  [
                      IconChip(icon: Icons.all_inbox, label: "الكل", 
                         selected: selectedCategory == 0,
                    onTap: () => setState(() => selectedCategory = 0)),
                      SizedBox(width: 8),
                      IconChip(icon: Icons.shopping_bag, label: "المشتريات",
                         selected: selectedCategory == 1,
                    onTap: () => setState(() => selectedCategory = 1)),
                      SizedBox(width: 8),
                      IconChip(icon: Icons.event, label: "التأجير",
                         selected: selectedCategory == 2,
                    onTap: () => setState(() => selectedCategory = 2)),
                      SizedBox(width: 8),
                      IconChip(icon: Icons.build, label: "الصيانة",
                         selected: selectedCategory == 3,
                    onTap: () => setState(() => selectedCategory = 3)),
                    ],
            );
  }
}