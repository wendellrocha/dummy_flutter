import 'package:equatable/equatable.dart';

import 'domain/entities/todo_model.dart';

abstract class TodosState extends Equatable {}

class TodosInitialState extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoadingState extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoadedState extends TodosState {
  final List<TodoModel> todos;

  TodosLoadedState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodosErrorState extends TodosState {
  final String message;

  TodosErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
