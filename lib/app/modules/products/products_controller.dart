import 'products_cubit.dart';

class ProductsController {
  final ProductsCubit _cubit;

  const ProductsController(this._cubit);

  ProductsCubit get cubit => _cubit;

  void fetchProducts() => _cubit.fetchProducts();
}
