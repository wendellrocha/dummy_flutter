import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'todos_container.dart';
import 'todos_controller.dart';
import 'todos_cubit.dart';
import 'todos_state.dart';

class TodosPage extends StatefulWidget {
  final String title;
  const TodosPage({this.title = 'Todos', super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final TodosController controller;

  @override
  void initState() {
    super.initState();
    TodosContainer.init();
    controller = GetIt.I.get<TodosController>();
    controller.fetchTodos();
  }

  @override
  void dispose() {
    TodosContainer.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCubit, TodosState>(
      bloc: controller.cubit,
      builder: (context, state) {
        if (state is TodosLoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state is TodosErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is TodosLoadedState) {
          return ListView.separated(
            itemCount: state.todos.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final item = state.todos[index];

              return ListTile(
                title: Text(
                  item.todo!,
                  style: TextStyle(
                    decoration: item.completed ?? false
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
