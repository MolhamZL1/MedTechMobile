import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/customcard.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/customicon.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/customtext.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/cutomcontainer.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/searchform.dart';

class ProductsViewBody extends StatelessWidget {
  ProductsViewBody({super.key});
  TextEditingController scontroller = TextEditingController();
  final List<Map<String, dynamic>> products = [
    {
         'image': AppImages.imagesHome,
      'title': 'جهاز قياس الضغط الرقمي',
      'category': 'أجهزة القياس',
      'rating': 4.8,
      'ratingCount': 124,
      'oldPrice': 500,
      'price': 450,
    },
    {
       'image':  AppImages.imagesProducts,
      'title': 'جهاز الأشعة المحمول',
      'category': 'أجهزة التصوير',
      'rating': 4.8,
      'ratingCount': 124,
      'oldPrice': 2700,
      'price': 2500,
    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("البحث والتصفح ")),
      body: Column(
        children: [
          Row(
            children: [
              Customicon(),
              Expanded(
                child: Searchform(
                  labelText: 'البحث عن الاجهزة الطبية ... ',
                  mycontroller: scontroller,
                  preIcon: Icon(
                    Icons.qr_code_2_outlined,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Cutomcontainer(text: 'الكل '),
                SizedBox(width: 10),
                Cutomcontainer(text: 'اجهزة القياس '),
                SizedBox(width: 10),
                Cutomcontainer(text: 'اجهزة التصوير '),
                SizedBox(width: 10),
                Cutomcontainer(text: 'اجهزة المراقبة '),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              color: AppColors.formcolor,
              child: Column(
                children: [
                  Customtext(text: '4 نتيجة '),
                  SizedBox(height: 1),
                  Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75, 
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return CustomProductCard(
                          imageUrl: product['image'],
                          title: product['title'],
                          rating: product['rating'],
                          oldPrice: product['oldPrice'],
                          category: product['category'],
                          ratingCount: product['ratingCount'],
                          price: product['price'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
