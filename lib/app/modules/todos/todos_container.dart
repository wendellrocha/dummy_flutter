import 'package:scaffold/scaffold.dart';

import 'data/datasources/todo_datasource_impl.dart';
import 'data/repositories/todo_repository_impl.dart';
import 'data/usecases/todo_usecase_impl.dart';
import 'domain/datasources/todo_datasource.dart';
import 'domain/repositories/todo_repository.dart';
import 'domain/usecases/todo_usecase.dart';
import 'todos_controller.dart';
import 'todos_cubit.dart';

class TodosContainer extends InjectionContainer {
  TodosContainer() : super(scope: 'todos');

  @override
  List<Injection> get binds => [
        (i) => i.registerLazySingleton<TodoDatasource>(
              () => TodoDatasourceImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<TodoRepository>(
              () => TodoRepositoryImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<TodoUseCase>(
              () => TodoUseCaseImpl(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<TodosCubit>(
              () => TodosCubit(
                i.get(),
              ),
            ),
        (i) => i.registerLazySingleton<TodosController>(
            () => TodosController(i.get())),
      ];
}
