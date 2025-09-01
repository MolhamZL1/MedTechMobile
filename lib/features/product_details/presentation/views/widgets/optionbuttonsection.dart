import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';
import 'package:medtech_mobile/features/product_details/presentation/cubits/cubit/transaction_type_cubit.dart';

class Optionbuttonsection extends StatelessWidget {
  const Optionbuttonsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: AnimatedCrossFadeButton(
              isSelected:
                  context.watch<TransactionTypeCubit>().getTransactionType() ==
                  TransactionType.sale,
              onTap: () {
                context.read<TransactionTypeCubit>().changeTransactionType(
                  TransactionType.sale,
                );
              },
              text: "Buy",
              icon: Icons.shopping_cart_outlined,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: AnimatedCrossFadeButton(
              isSelected:
                  context.watch<TransactionTypeCubit>().getTransactionType() ==
                  TransactionType.rent,
              onTap: () {
                context.read<TransactionTypeCubit>().changeTransactionType(
                  TransactionType.rent,
                );
              },
              text: "Rent",
              icon: Icons.calendar_today_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCrossFadeButton extends StatelessWidget {
  const AnimatedCrossFadeButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.text,
    required this.icon,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onTap,
          label: Text(text),
          icon: Icon(icon),
        ),
      ),
      secondChild: SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: onTap,
          label: Text(text),
          icon: Icon(icon),
        ),
      ),
      crossFadeState:
          isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Durations.short4,
    );
  }
}
