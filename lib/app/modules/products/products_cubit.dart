import 'package:abstract_bloc/abstract_bloc.dart';

import 'domain/entities/product_model.dart';
import 'domain/usecases/product_usecase.dart';

class ProductsCubit extends Store<List<ProductModel>> {
  final ProductUseCase _useCase;

  ProductsCubit(this._useCase);

  void fetchProducts() => execute(() => _useCase.getProducts());
}
