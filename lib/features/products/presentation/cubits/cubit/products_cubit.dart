import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/category_item.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial()) {
    getProducts();
  }
  final ProductsRepo productsRepo;
  List<ProductEntity> products = [];
  int categoryIndex = 0;
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
}
