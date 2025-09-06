import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/widgets/CustomLoadingCircle.dart';
import 'package:medtech_mobile/features/order/presentation/cubits/order/order_cubit.dart';
import 'package:medtech_mobile/features/order/presentation/cubits/order/order_state.dart';

import '../../../domain/entities/order_entities.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Orders",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            trailing: Text(
              "${context.watch<OrderCubit>().orders.length} items",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderLoaded) {
                  return ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder:
                        (context, index) =>
                            OrderCardEN(order: state.orders[index]),
                  );
                } else if (state is OrderError) {
                  return Center(child: Text(state.message));
                } else {
                  return const CustomLoadingCircle();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCardEN extends StatelessWidget {
  final OrderEntity order;
  const OrderCardEN({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = order.items.isNotEmpty ? order.items.first : null;
    final isRent = (item?.transactionType.toUpperCase() == 'RENT');

    return Card(
      elevation: 0.6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: type + code + status
            Row(
              children: [
                Icon(
                  isRent ? Icons.event_available : Icons.shopping_bag_outlined,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  '${isRent ? 'Rent' : 'Order'} • #${_orderCode(isRent, order.id)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                _StatusChip(statusText: order.status.name),
              ],
            ),

            const SizedBox(height: 4),
            Text(
              _fmtDate(order.createdAt),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.hintColor,
              ),
            ),

            const SizedBox(height: 12),

            // Body: image + info + total
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Thumb(imageUrl: item?.productImage),
                const SizedBox(width: 10),
                Expanded(child: _MainTextBlock(item: item)),
                const SizedBox(width: 10),
                Text(
                  '${order.totalAmount}', // no currency since it's not in entity
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _orderCode(bool isRent, int id) {
    final prefix = isRent ? 'RNT' : 'ORD';
    return '$prefix-${id.toString().padLeft(3, '0')}';
  }
}

class _MainTextBlock extends StatelessWidget {
  final OrderItemEntity? item;
  const _MainTextBlock({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (item == null) {
      return Text('No items', style: theme.textTheme.bodyMedium);
    }

    String sub;
    final isRent = item!.transactionType.toUpperCase() == 'RENT';
    if (isRent &&
        item!.rentalStartDate != null &&
        item!.rentalEndDate != null) {
      final days = _daysBetween(item!.rentalStartDate!, item!.rentalEndDate!);
      sub =
          'Rent: ${_fmtDate(item!.rentalStartDate!)} → ${_fmtDate(item!.rentalEndDate!)} • ${days}d';
    } else {
      sub = 'Qty: ${item!.quantity}';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item!.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
        ),
      ],
    );
  }
}

class _Thumb extends StatelessWidget {
  final String? imageUrl;
  const _Thumb({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final url =
        (imageUrl != null && imageUrl!.startsWith('http')) ? imageUrl : null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:
          url == null
              ? Container(
                width: 56,
                height: 56,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.image, size: 22),
              )
              : Image.network(
                url,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      width: 56,
                      height: 56,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: const Icon(Icons.broken_image_outlined, size: 22),
                    ),
              ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String statusText; // uses enum name from entity
  const _StatusChip({required this.statusText});

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = _colorsFor(statusText, Theme.of(context).colorScheme);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        _titleCase(statusText),
        style: TextStyle(color: fg, fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }

  static (Color, Color) _colorsFor(String s, ColorScheme cs) {
    final v = s.toUpperCase();
    if (v == 'PENDING') return (cs.secondaryContainer, cs.onSecondaryContainer);
    if (v == 'APPROVED') return (Colors.blue.shade100, Colors.blue.shade900);
    if (v == 'REJECTED') return (Colors.red.shade100, Colors.red.shade900);
    if (v == 'CANCELLED') return (Colors.grey.shade300, Colors.grey.shade900);
    if (v == 'COMPLETED') return (Colors.green.shade100, Colors.green.shade900);
    return (cs.surfaceVariant, cs.onSurfaceVariant);
  }
}

/// ===== Helpers =====

String _fmtDate(DateTime d) {
  final l = d.toLocal();
  final y = l.year.toString().padLeft(4, '0');
  final m = l.month.toString().padLeft(2, '0');
  final dd = l.day.toString().padLeft(2, '0');
  return '$y-$m-$dd';
}

int _daysBetween(DateTime start, DateTime end) {
  final s = DateTime(start.year, start.month, start.day);
  final e = DateTime(end.year, end.month, end.day);
  return e.difference(s).inDays;
}

String _titleCase(String v) =>
    v.isEmpty ? v : v[0].toUpperCase() + v.substring(1).toLowerCase();
