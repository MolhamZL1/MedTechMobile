import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';

class Favoitepage extends StatefulWidget {
  const Favoitepage({super.key});

  @override
  State<Favoitepage> createState() => _FavoitepageState();
}

class _FavoitepageState extends State<Favoitepage> {
  bool isFavorited = true; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: customAppBar(title: 'المنتجات المفضلة',icon: Icons.favorite,),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
                 mainAxisSize: MainAxisSize.min, 
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/products.svg',
                        height: 120,
                        // width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                 Text(
            
                  'أجهزة القياس',
                  
                  style: TextStyle(
                    
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  'جهاز قياس الضغط الرقمي',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber,),
                      const SizedBox(width: 6),
                        const Text(
                        '4.8',
                        style: TextStyle(color: Colors.black),
                      ), const SizedBox(width: 6),
                      const Text(
                        '(124)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'ر.س 450',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                     Text(
                      textAlign: TextAlign.right,
                      '500 ر.س',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'أضيف في ٣ رجب ١٤٤٥ هـ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('إضافة للسلة'),
                      ),
                    ),
                    const SizedBox(width: 8),
                  Container(
        decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: const Color.fromARGB(255, 227, 133, 126).withOpacity(0.15), 
        ),
        child: IconButton(
      icon: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
        ),
      ),
      
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}