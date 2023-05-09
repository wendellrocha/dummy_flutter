import 'package:scaffold/scaffold.dart';

import 'domain/entities/todo_model.dart';
import 'domain/usecases/todo_usecase.dart';

class TodosCubit extends Store<List<TodoModel>> {
  final TodoUseCase _useCase;

  TodosCubit(this._useCase);

  void fetchTodos() => execute(() => _useCase.getTodos());
}
