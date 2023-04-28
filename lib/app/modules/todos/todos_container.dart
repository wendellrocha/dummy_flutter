import 'package:get_it/get_it.dart';

import 'data/datasources/todo_datasource_impl.dart';
import 'data/repositories/todo_repository_impl.dart';
import 'data/usecases/todo_usecase_impl.dart';
import 'domain/datasources/todo_datasource.dart';
import 'domain/repositories/todo_repository.dart';
import 'domain/usecases/todo_usecase.dart';
import 'todos_controller.dart';
import 'todos_cubit.dart';

class TodosContainer {
  static void init() {
    GetIt.I.pushNewScope(
      init: (i) {
        i.registerLazySingleton<TodoDatasource>(
          () => TodoDatasourceImpl(
            i.get(),
          ),
        );
        i.registerLazySingleton<TodoRepository>(
          () => TodoRepositoryImpl(
            i.get(),
          ),
        );
        i.registerLazySingleton<TodoUseCase>(
          () => TodoUseCaseImpl(
            i.get(),
          ),
        );
        i.registerLazySingleton<TodosCubit>(
          () => TodosCubit(
            i.get(),
          ),
        );
        i.registerLazySingleton(() => TodosController(i.get()));
      },
      scopeName: 'todos',
    );
  }

  static void reset() => GetIt.I.popScope();
}
