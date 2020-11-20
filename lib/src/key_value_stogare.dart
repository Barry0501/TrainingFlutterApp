import 'dart:async';
import 'dart:convert';

import 'package:flutterapp/src/repo/todo_entity.dart';
import 'package:key_value_store/key_value_store.dart';

import 'repo/todos_repository.dart';

class KeyValueStorage implements TodosRepository {
  final String key;
  final KeyValueStore store;
  final JsonCodec codec;

  const KeyValueStorage(this.key, this.store, [this.codec = json]);

  @override
  Future<List<TodoEntity>> loadTodos() async {
    return codec
        .decode(store.getString(key))['todos']
        .cast<Map<String, Object>>()
        .map<TodoEntity>(TodoEntity.fromJson)
        .toList(growable: false);
  }

  @override
  Future<bool> saveTodos(List<TodoEntity> todos) {
    return store.setString(
      key,
      codec.encode({
        'todos': todos.map((todo) => todo.toJson()).toList(),
      }),
    );
  }
}