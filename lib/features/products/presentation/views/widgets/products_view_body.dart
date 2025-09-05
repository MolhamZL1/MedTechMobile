import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'products_grid_display.dart';
import 'products_search_bar.dart';
import 'search_history_list.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody>
    with SingleTickerProviderStateMixin {
  bool showHistory = false;
  late AnimationController _historyAnimationController;
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _historyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && showHistory) {
        toggleHistory(false);
      }
    });
  }

  @override
  void dispose() {
    _historyAnimationController.dispose();
    _searchFocusNode.removeListener(() {});
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void toggleHistory(bool value) {
    if (showHistory == value) return;
    setState(() {
      showHistory = value;
      if (showHistory) {
        _historyAnimationController.forward(from: 0);
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("المنتجات", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          ProductsSearchBar(
            controller: _searchController,
            focusNode: _searchFocusNode,
            onSearchTapped: () => toggleHistory(true),
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
              child: showHistory && history.isNotEmpty
                  ? SearchHistoryList(
                history: history,
                animationController: _historyAnimationController,
                searchController: _searchController,
                searchFocusNode: _searchFocusNode,
              )
                  : const ProductsGridDisplay(),
            ),
          ),
        ],
      ),
    );
  }
}
