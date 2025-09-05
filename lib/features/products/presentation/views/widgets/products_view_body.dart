import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/custtom_filter_icon.dart';

import '../../cubits/cubit/products_cubit.dart';
import 'ProductsGridView.dart';
import 'category_list.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody>
    with SingleTickerProviderStateMixin {
  bool showHistory = false;
  late AnimationController _historyAnimationController;
  @override
  void initState() {
    super.initState();
    _historyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _historyAnimationController.dispose();
    super.dispose();
  }

  void toggleHistory(bool value) {
    setState(() {
      showHistory = value;
      if (showHistory) {
        _historyAnimationController.forward(
          from: 0,
        ); // تشغيل الأنيميشن عند الفتح
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final history = context.watch<ProductsCubit>().searchHistory;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// عنوان الصفحة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "المنتجات",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CustomFilterIcon(),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    onTap: () => toggleHistory(true),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        context.read<ProductsCubit>().searchProducts(value);
                        context.read<ProductsCubit>().saveSearchQuery(value);
                        toggleHistory(false);
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      hintText: 'ابحث عن الاجهزة الطبية ... ',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code_scanner_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      fillColor: AppColors.formcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child:
                  showHistory && history.isNotEmpty
                      ? _buildSearchHistory(context, history)
                      : _buildProductsDisplay(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHistory(BuildContext context, List<String> history) {
    return Padding(
      key: const ValueKey('history'),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "سجل البحث",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final query = history.reversed.toList()[index];
                final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _historyAnimationController,
                    curve: Interval(
                      (0.1 * index) / history.length,
                      0.5 + (0.1 * index) / history.length,
                      curve: Curves.easeOutCubic,
                    ),
                  ),
                );

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(query),
                      trailing: IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {},
                      ),
                      onTap: () {
                        context.read<ProductsCubit>().searchProducts(query);
                        toggleHistory(false);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsDisplay(BuildContext context) {
    return Padding(
      key: const ValueKey('products'),
      padding: const EdgeInsets.symmetric(horizontal: 0), // توحيد الـ padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35, child: CategoriesList()),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "${context.watch<ProductsCubit>().products.length} منتجات",
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ProductsGridView(products: state.products);
                } else if (state is ProductsError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
