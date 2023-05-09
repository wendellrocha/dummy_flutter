import 'package:scaffold/scaffold.dart';

import 'data/datasources/product_datasource_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'data/usecases/product_usecase_impl.dart';
import 'domain/datasources/product_datasource.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/usecases/product_usecase.dart';
import 'products_controller.dart';
import 'products_cubit.dart';

class ProductsContainer extends InjectionContainer {
  ProductsContainer() : super(scope: 'products');

  @override
  List<Injection> get binds => [
        (i) => i.registerLazySingleton<ProductDatasource>(
              () => ProductDatasourceImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<ProductRepository>(
              () => ProductRepositoryImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<ProductUseCase>(
              () => ProductUseCaseImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<ProductsController>(
              () => ProductsController(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<ProductsCubit>(
              () => ProductsCubit(
                i.get(),
              ),
            )
      ];
}
