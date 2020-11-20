import 'package:flutter/material.dart';

import 'src/injector.dart';
import 'src/repo/user_repository.dart';
import 'src/screens/add_edit_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/todo_bloc_provider.dart';
import 'src/todos_interactor.dart';
import 'src/todos_list_bloc.dart';

class BlocApp extends StatelessWidget {
  final TodosInteractor todosInteractor;
  final UserRepository userRepository;

  const BlocApp({
    Key key,
    @required this.todosInteractor,
    @required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Injector(
      todosInteractor: todosInteractor,
      userRepository: userRepository,
      child: TodosBlocProvider(
        bloc: TodosListBloc(todosInteractor),
        child: MaterialApp(
          // onGenerateTitle: (context) => BlocLocalizations.of(context).appTitle,
          // localizationsDelegates: [
          //   ArchSampleLocalizationsDelegate(),
          //   InheritedWidgetLocalizationsDelegate(),
          // ],
          routes: {
            ArchSampleRoutes.home: (context) {
              return HomeScreen(
                repository: Injector.of(context).userRepository,
              );
            },
            ArchSampleRoutes.addTodo: (context) {
              return AddEditScreen(
                addTodo: TodosBlocProvider.of(context).addTodo.add,
              );
            },
          },
        ),
      ),
    );
  }
}

class ArchSampleRoutes {
  static final home = '/';
  static final addTodo = '/addTodo';
}