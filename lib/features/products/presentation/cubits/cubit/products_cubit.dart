import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial()) {
    getProducts(category: "All");
  }
  final ProductsRepo productsRepo;
  getProducts({required String category}) async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts(category: category);
    result.fold(
      (l) => emit(ProductsError(l.errMessage)),
      (r) => emit(ProductsSuccess(r)),
    );
  }
}
