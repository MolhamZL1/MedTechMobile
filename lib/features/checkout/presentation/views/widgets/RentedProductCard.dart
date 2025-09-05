import 'package:flutter/material.dart';

import '../../../../cart/domain/entities/cart_item_entity.dart';
import '../../../data/model/RentalPeriod.dart';
import 'checkout_view_body.dart';

class RentedProductCard extends StatelessWidget {
  final CartItemEntity item;
  final RentalPeriod? selection;
  final VoidCallback onPickRange;
  final VoidCallback? onClear;
  final String? dateLabel;

  const RentedProductCard({
    super.key,
    required this.item,
    required this.selection,
    required this.onPickRange,
    this.onClear,
    this.dateLabel,
  });

  @override
  Widget build(BuildContext context) {
    final p = item.productEntity;
    final img = p.imagesUrl.isNotEmpty ? p.imagesUrl.first : null;

    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      img != null
                          ? Image.network(
                            img,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  color: Colors.grey.shade200,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.broken_image),
                                ),
                          )
                          : Container(
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Icon(Icons.image_not_supported),
                          ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // الاسم
            Flexible(
              child: Text(
                p.nameEn,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 2),

            // الشركة
            if ((p.companyEn ?? '').isNotEmpty)
              Flexible(
                child: Text(
                  p.companyEn ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),

            const SizedBox(height: 6),

            // السعر
            Text(
              'سعر الإيجار: ${p.rentalPrice}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),

            // الفترة المختارة
            if (dateLabel != null) ...[
              const SizedBox(height: 6),
              Text(
                dateLabel!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ],

            const Spacer(),

            // الأزرار
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onPickRange,
                    icon: const Icon(Icons.event),
                    label: Text(
                      selection == null ? 'اختر الفترة' : 'تعديل الفترة',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  tooltip: 'مسح الفترة',
                  onPressed: onClear,
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
