import 'todos_cubit.dart';

class TodosController {
  final TodosCubit _cubit;

  const TodosController(this._cubit);

  TodosCubit get cubit => _cubit;

  void fetchTodos() => _cubit.fetchTodos();
}
