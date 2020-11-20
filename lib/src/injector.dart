import 'package:flutter/material.dart';

import 'repo/user_repository.dart';
import 'todos_interactor.dart';

class Injector extends InheritedWidget {
  final TodosInteractor todosInteractor;
  final UserRepository userRepository;

  Injector({
    Key key,
    @required this.todosInteractor,
    @required this.userRepository,
    @required Widget child,
  }) : super(key: key, child: child);

  static Injector of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Injector>();

  @override
  bool updateShouldNotify(Injector oldWidget) =>
      todosInteractor != oldWidget.todosInteractor ||
          userRepository != oldWidget.userRepository;
}