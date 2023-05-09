import 'package:scaffold/scaffold.dart';

import 'domain/entities/product_model.dart';
import 'domain/usecases/product_usecase.dart';

class ProductsCubit extends Store<List<ProductModel>> {
  final ProductUseCase _useCase;

  ProductsCubit(this._useCase);

  void fetchProducts() => execute(() => _useCase.getProducts());
}
