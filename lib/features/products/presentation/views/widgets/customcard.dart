import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final double rating;
  final int ratingCount;
  final double price;
  final double? oldPrice;
  final bool isFavorite;
  final String? badgeText;
  final String? discountText;

  const CustomProductCard({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.rating,
    required this.ratingCount,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
    this.badgeText,
    this.discountText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (badgeText != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badgeText!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                    decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
          padding: const EdgeInsets.all(6),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating ($ratingCount)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ر.س $price',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (oldPrice != null)
                          Text(
                            'ر.س $oldPrice',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    Icon(Icons.shopping_cart, color: Colors.blue),
                  ],
                ),
                if (discountText != null)
                  Text(
                    discountText!,
                    style: const TextStyle(fontSize: 12, color: Colors.green),
                  ),
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}
