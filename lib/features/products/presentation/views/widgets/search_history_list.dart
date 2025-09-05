import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/products/presentation/cubits/cubit/products_cubit.dart';

class SearchHistoryList extends StatelessWidget {
  final List<String> history;
  final AnimationController animationController;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  const SearchHistoryList({
    super.key,
    required this.history,
    required this.animationController,
    required this.searchController,
    required this.searchFocusNode,
  });

  @override
  Widget build(BuildContext context) {
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
                final animation = _createAnimation(index);

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
                        onPressed: () {
                        },
                      ),
                      onTap: () {
                        searchController.text = query;
                        context.read<ProductsCubit>().searchProducts(query);
                        searchFocusNode.unfocus();
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

  Animation<double> _createAnimation(int index) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          (0.1 * index) / history.length,
          0.5 + (0.1 * index) / history.length,
          curve: Curves.easeOutCubic,
        ),
      ),
    );
  }
}
