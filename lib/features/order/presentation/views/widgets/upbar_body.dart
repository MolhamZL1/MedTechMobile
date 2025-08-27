import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/upbar.dart';

class UpbarBody extends StatelessWidget {
  final int selectedStatus;
  final Function(int) onStatusChanged;

  const UpbarBody({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        StatusChip(
          label: "الكل",
          count: 5,
          selected: selectedStatus == 0,
          onTap: () => onStatusChanged(0),
        ),
        StatusChip(
          label: "نشط",
          count: 2,
          selected: selectedStatus == 1,
          onTap: () => onStatusChanged(1),
        ),
        StatusChip(
          label: "مكتمل",
          count: 2,
          selected: selectedStatus == 2,
          onTap: () => onStatusChanged(2),
        ),
        StatusChip(
          label: "ملغي",
          count: 1,
          selected: selectedStatus == 3,
          onTap: () => onStatusChanged(3),
        ),
      ],
    );
  }
}
