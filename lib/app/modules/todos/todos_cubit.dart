import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/http/errors/http_error.dart';
import 'domain/usecases/todo_usecase.dart';
import 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodoUseCase _usecase;
  TodosCubit(this._usecase) : super(TodosInitialState());

  void fetchTodos() async {
    try {
      emit(TodosLoadingState());
      final response = await _usecase.getTodos();
      emit(TodosLoadedState(response));
    } catch (e) {
      if (e is HttpError) {
        emit(TodosErrorState(e.message!));
      } else {
        emit(TodosErrorState(e.toString()));
      }
    }
  }
}
