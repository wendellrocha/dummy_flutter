import 'package:flutter/material.dart';
import 'package:scaffold/scaffold.dart';

import 'domain/entities/todo_model.dart';
import 'todos_container.dart';
import 'todos_controller.dart';

class TodosPage extends StatefulWidget {
  final String title;
  const TodosPage({this.title = 'Todos', super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends InjectionState<TodosPage, TodosController> {
  @override
  InjectionContainer get container => TodosContainer();

  @override
  void initState() {
    super.initState();
    controller.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<List<TodoModel>>(
      cubit: controller.cubit,
      onError: (context, state) {
        return Center(
          child: Text(state.message),
        );
      },
      onLoading: (context) {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      onSuccess: (context, state) {
        return ListView.separated(
          itemCount: state.content.length,
          separatorBuilder: (context, index) => const Divider(),
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final item = state.content[index];

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
      },
    );
  }
}
