import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/category_item.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial()) {
    getProducts();
    loadSearchHistory();

  }
  final ProductsRepo productsRepo;
  List<ProductEntity> products = [];
  int categoryIndex = 0;
  List<String> searchHistory = [];

  getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts(
      category: categories[categoryIndex],
    );
    result.fold((l) => emit(ProductsError(l.errMessage)), (r) {
      products = r;
      emit(ProductsSuccess(r));
    });
  }

  setCategory(int index) {
    categoryIndex = index;
    getProducts();
  }
  searchProducts(String query) async {
    if (query.isEmpty) {
      getProducts();
      return;
    }
    emit(ProductsLoading());
    var result = await productsRepo.searchProducts(query: query);
    result.fold(
          (l) => emit(ProductsError(l.errMessage)),
          (r) {
        products = r;
        emit(ProductsSuccess(r));
      },
    );
  }

  saveSearchQuery(String query) async {
    if (query.trim().isEmpty) return;

    if (!searchHistory.contains(query)) {
      searchHistory.add(query);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('searchHistory', searchHistory);
    }
  }

  loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    searchHistory = prefs.getStringList('searchHistory') ?? [];
  }
}

