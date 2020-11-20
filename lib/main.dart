// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'src/key_value_stogare.dart';
import 'src/repo/local_storage_repo.dart';
import 'src/repo/reactive_local_storage_repo.dart';
import 'src/repo/user_entity.dart';
import 'src/repo/user_repository.dart';
import 'src/todos_interactor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocApp(
    todosInteractor: TodosInteractor(
      ReactiveLocalStorageRepository(
        repository: LocalStorageRepository(
          localStorage: KeyValueStorage(
            'bloc_todos',
            FlutterKeyValueStore(await SharedPreferences.getInstance()),
          ),
        ),
      ),
    ),
    userRepository: AnonymousUserRepository(),
  ));
}

class AnonymousUserRepository implements UserRepository {
  @override
  Future<UserEntity> login() {
    return Future.value(UserEntity(id: 'anonymous'));
  }
}
