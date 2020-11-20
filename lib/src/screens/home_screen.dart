// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/app.dart';
import 'package:flutterapp/keys.dart';
import 'package:flutterapp/src/injector.dart';
import 'package:flutterapp/src/models/visibility_filter.dart';
import 'package:flutterapp/src/repo/user_entity.dart';
import 'package:flutterapp/src/repo/user_repository.dart';
import 'package:flutterapp/src/stats_bloc.dart';
import 'package:flutterapp/src/todo_bloc_provider.dart';
import 'package:flutterapp/src/todos_list_bloc.dart';
import 'package:flutterapp/src/user_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../todo_list.dart';
import 'filter_button.dart';

enum AppTab { todos, stats }

class HomeScreen extends StatefulWidget {
  final UserRepository repository;

  HomeScreen({@required this.repository})
      : super(key: ArchSampleKeys.homeScreen);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  UserBloc usersBloc;
  StreamController<AppTab> tabController;

  @override
  void initState() {
    super.initState();

    usersBloc = UserBloc(widget.repository);
    tabController = StreamController<AppTab>();
  }

  @override
  void dispose() {
    tabController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todosBloc = TodosBlocProvider.of(context);

    return StreamBuilder<UserEntity>(
      stream: usersBloc.login(),
      builder: (context, userSnapshot) {
        return StreamBuilder<AppTab>(
          initialData: AppTab.todos,
          stream: tabController.stream,
          builder: (context, activeTabSnapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text('appTitle'),
                actions: _buildActions(
                  todosBloc,
                  activeTabSnapshot,
                  userSnapshot.hasData,
                ),
              ),
              body: userSnapshot.hasData
                  ? activeTabSnapshot.data == AppTab.todos
                      ? TodoList()
                      : StatsCounter(
                          buildBloc: () =>
                              StatsBloc(Injector.of(context).todosInteractor),
                        )
                  : Center(
                      child: Text('loading'),
                    ),
              floatingActionButton: FloatingActionButton(
                key: ArchSampleKeys.addTodoFab,
                onPressed: () {
                  Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
                },
                child: Icon(Icons.add),
              ),
              bottomNavigationBar: BottomNavigationBar(
                key: ArchSampleKeys.tabs,
                currentIndex: AppTab.values.indexOf(activeTabSnapshot.data),
                onTap: (index) {
                  tabController.add(AppTab.values[index]);
                },
                items: AppTab.values.map((tab) {
                  return BottomNavigationBarItem(
                    icon: Icon(
                      tab == AppTab.todos ? Icons.list : Icons.show_chart,
                      key: tab == AppTab.stats
                          ? ArchSampleKeys.statsTab
                          : ArchSampleKeys.todoTab,
                    ),
                    title: Text(
                      tab == AppTab.stats
                          ? 'stats'
                          : 'todos',
                    ),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildActions(
    TodosListBloc todosBloc,
    AsyncSnapshot<AppTab> activeTabSnapshot,
    bool hasData,
  ) {
    if (!hasData) return [];

    return [
      StreamBuilder<VisibilityFilter>(
        stream: todosBloc.activeFilter,
        builder: (context, snapshot) {
          return FilterButton(
            isActive: activeTabSnapshot.data == AppTab.todos,
            activeFilter: snapshot.data ?? VisibilityFilter.all,
            onSelected: todosBloc.updateFilter.add,
          );
        },
      ),
      StreamBuilder<ExtraActionsButtonViewModel>(
        stream: Rx.combineLatest2(
          todosBloc.allComplete,
          todosBloc.hasCompletedTodos,
          (allComplete, hasCompletedTodos) {
            return ExtraActionsButtonViewModel(
              allComplete,
              hasCompletedTodos,
            );
          },
        ),
        builder: (context, snapshot) {
          return ExtraActionsButton(
            allComplete: snapshot.data?.allComplete ?? false,
            hasCompletedTodos: snapshot.data?.hasCompletedTodos ?? false,
            onSelected: (action) {
              if (action == ExtraAction.toggleAllComplete) {
                todosBloc.toggleAll.add(null);
              } else if (action == ExtraAction.clearCompleted) {
                todosBloc.clearCompleted.add(null);
              }
            },
          );
        },
      )
    ];
  }
}

class ExtraActionsButton extends StatelessWidget {
  final PopupMenuItemSelected<ExtraAction> onSelected;
  final bool allComplete;
  final bool hasCompletedTodos;

  ExtraActionsButton({
    this.onSelected,
    this.allComplete = false,
    this.hasCompletedTodos = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExtraAction>(
      key: ArchSampleKeys.extraActionsButton,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<ExtraAction>>[
          PopupMenuItem<ExtraAction>(
            key: ArchSampleKeys.toggleAll,
            value: ExtraAction.toggleAllComplete,
            child: Text(
              allComplete
                  ? 'markAllIncomplete'
                  : 'markAllComplete',
            ),
          ),
          PopupMenuItem<ExtraAction>(
            key: ArchSampleKeys.clearCompleted,
            value: ExtraAction.clearCompleted,
            child: Text(
              'clearCompleted',
            ),
          ),
        ];
      },
    );
  }
}

class ExtraActionsButtonViewModel {
  final bool allComplete;
  final bool hasCompletedTodos;

  ExtraActionsButtonViewModel(this.allComplete, this.hasCompletedTodos);
}

enum ExtraAction { toggleAllComplete, clearCompleted }

class StatsCounter extends StatefulWidget {
  final StatsBloc Function() buildBloc;

  StatsCounter({Key key, @required this.buildBloc})
      : super(key: key ?? ArchSampleKeys.statsCounter);

  @override
  StatsCounterState createState() {
    return StatsCounterState();
  }
}

class StatsCounterState extends State<StatsCounter> {
  StatsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.buildBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'completedTodos',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: StreamBuilder<int>(
              stream: bloc.numComplete,
              builder: (context, snapshot) => Text(
                '${snapshot.data ?? 0}',
                key: ArchSampleKeys.statsNumCompleted,
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'activeTodos',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: StreamBuilder<int>(
              stream: bloc.numActive,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data ?? 0}',
                  key: ArchSampleKeys.statsNumActive,
                  style: Theme.of(context).textTheme.subhead,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}