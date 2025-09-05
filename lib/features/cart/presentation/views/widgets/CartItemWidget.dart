import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/widgets/CustomImageNetwork.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';

import '../../../../product_details/presentation/views/product_details_view.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../cubits/fetch_Cart/fetch_cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    final product = cartItemEntity.productEntity;
    final qty = cartItemEntity.quantity;

    String _fmt(num n) {
      final s = n.toStringAsFixed(2);
      return s.replaceFirst(RegExp(r'\.00$'), '');
    }

    // اختياري: إذا السيرفر ما بيرجع lineTotal صح، احسب تقريبي محلي
    final num unitPrice = product.salePrice;
    final num lineTotal = cartItemEntity.lineTotal;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments: product,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(.6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة تبعك نفسها
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: product.id,
                  child: SizedBox(
                    width: 84,
                    height: 84,
                    child: CustomImageNetwork(
                      imageUrl:
                          product.imagesUrl.isNotEmpty
                              ? product.imagesUrl.first
                              : "",
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // تفاصيل + أزرار
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الاسم
                    Text(
                      product.nameEn,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // الشركة • التصنيف (خفيفة)
                    Row(
                      children: [
                        if (product.companyEn.isNotEmpty)
                          Flexible(
                            child: Text(
                              product.companyEn,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey[600]),
                            ),
                          ),
                        if (product.companyEn.isNotEmpty &&
                            product.categoryEn.isNotEmpty)
                          Text(
                            '  •  ',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[600]),
                          ),
                        if (product.categoryEn.isNotEmpty)
                          Flexible(
                            child: Text(
                              product.categoryEn,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey[600]),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // السعر لكل وحدة + Line Total كبادج حلوة
                    Row(
                      children: [
                        _PricePill(text: '\$${_fmt(unitPrice)} / unit'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Line: \$${_fmt(lineTotal)}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const SizedBox(height: 8),

                    // عدّاد الكمية
                    Row(
                      children: [
                        _QtyBtn(
                          icon: Icons.remove_circle_outline,
                          onTap:
                              qty <= 1
                                  ? null
                                  : () => context
                                      .read<FetchCartCubit>()
                                      .decrement(cartItemEntity),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            qty.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        _QtyBtn(
                          icon: Icons.add_circle_outline,
                          onTap:
                              () => context.read<FetchCartCubit>().increment(
                                cartItemEntity,
                              ),
                        ),
                        Spacer(),
                        if (cartItemEntity.transactionType ==
                            TransactionType.rent)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Rental',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // حذف
              IconButton(
                onPressed: () {
                  context.read<FetchCartCubit>().deleteCartItem(
                    item: cartItemEntity,
                  );
                },
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                tooltip: 'Remove',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  const _QtyBtn({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      splashRadius: 22,
      onPressed: onTap,
      icon: Icon(icon),
    );
  }
}

class _PricePill extends StatelessWidget {
  const _PricePill({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Theme.of(context).colorScheme.primary.withOpacity(.08),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
