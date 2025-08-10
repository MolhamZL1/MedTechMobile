import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/buybutton.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/rentbotton.dart';

class Optionbuttonsection extends StatefulWidget {
  const Optionbuttonsection({super.key});

  @override
  State<Optionbuttonsection> createState() => _OptionbuttonsectionState();
}

class _OptionbuttonsectionState extends State<Optionbuttonsection> {
  bool isBuySelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: AnimatedCrossFadeButton(
              isSelected: isBuySelected,
              onTap: () {
                isBuySelected = true;
                setState(() {});
              },
              text: "Buy",
              icon: Icons.shopping_cart_outlined,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: AnimatedCrossFadeButton(
              isSelected: !isBuySelected,
              onTap: () {
                isBuySelected = false;
                setState(() {});
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
