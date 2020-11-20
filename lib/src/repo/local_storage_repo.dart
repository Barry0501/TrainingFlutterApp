import 'package:flutter/material.dart';
import 'package:flutterapp/src/repo/todos_repository.dart';
import 'package:flutterapp/src/web_client.dart';

import 'todo_entity.dart';

class LocalStorageRepository implements TodosRepository {
  final TodosRepository localStorage;
  final TodosRepository webClient;

  const LocalStorageRepository({
    @required this.localStorage,
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
      return await localStorage.loadTodos();
    } catch (e) {
      final todos = await webClient.loadTodos();

      await localStorage.saveTodos(todos);

      return todos;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveTodos(List<TodoEntity> todos) {
    return Future.wait<dynamic>([
      localStorage.saveTodos(todos),
      webClient.saveTodos(todos),
    ]);
  }
}