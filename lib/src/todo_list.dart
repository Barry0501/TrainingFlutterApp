import 'package:flutter/material.dart';
import 'package:flutterapp/keys.dart';
import 'package:flutterapp/src/injector.dart';

import 'models/todo.dart';
import 'screens/detail_screen.dart';
import 'todo_bloc.dart';
import 'todo_bloc_provider.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: TodosBlocProvider.of(context).visibleTodos,
      builder: (context, snapshot) => snapshot.hasData
          ? _buildList(snapshot.data)
          : Center(child: Text('loading'),),
    );
  }

  ListView _buildList(List<Todo> todos) {
    return ListView.builder(
      key: ArchSampleKeys.todoList,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];

        return TodoItem(
          todo: todo,
          onDismissed: (direction) {
            _removeTodo(context, todo);
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return DetailScreen(
                    todoId: todo.id,
                    initBloc: () =>
                        TodoBloc(Injector.of(context).todosInteractor),
                  );
                },
              ),
            ).then((todo) {
              if (todo is Todo) {
                _showUndoSnackbar(context, todo);
              }
            });
          },
          onCheckboxChanged: (complete) {
            TodosBlocProvider.of(context)
                .updateTodo
                .add(todo.copyWith(complete: !todo.complete));
          },
        );
      },
    );
  }

  void _removeTodo(BuildContext context, Todo todo) {
    TodosBlocProvider.of(context).deleteTodo.add(todo.id);

    _showUndoSnackbar(context, todo);
  }

  void _showUndoSnackbar(BuildContext context, Todo todo) {
    final snackBar = SnackBar(
      key: ArchSampleKeys.snackbar,
      duration: Duration(seconds: 2),
      content: Text(
        'delete task ${todo.note}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      action: SnackBarAction(
        key: ArchSampleKeys.snackbarAction(todo.id),
        label: 'undo',
        onPressed: () {
          TodosBlocProvider.of(context).addTodo.add(todo);
        },
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
