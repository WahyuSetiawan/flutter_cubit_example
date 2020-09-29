import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bon/bloc/bloc_home.dart';
import 'package:flutter_bon/view/view_dashboard.dart';

class SimpleBlockObserver extends BlocObserver {}

void main() {
  Bloc.observer = SimpleBlockObserver();

  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        home: Center(
            child: BlocProvider(
          create: (context) => ChangeHome(
            RepositoryHome(
              changeHomeProvider: ChangeHomeProvider(
                homePage: HomePage.HomeGraph,
              ),
            ),
          ),
          child: BlocBuilder<ChangeHome, int>(
            builder: (context, state) {
              return Scaffold(
                body: IndexedStack(
                  index: state,
                  children: [
                    ViewDashboard(),
                    Center(
                      child: Text("Graph"),
                    ),
                    Center(
                      child: Text("History"),
                    ),
                    Center(
                      child: Text("Setting"),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: state,
                  onTap: (value) {
                    context.bloc<ChangeHome>().add(
                          value == 0
                              ? HomePage.HomePopular
                              : value == 1
                                  ? HomePage.HomeGraph
                                  : value == 2
                                      ? HomePage.HomeHistory
                                      : HomePage.HomeSetting,
                        );
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.black38,
                      ),
                      title: Text("Dashboard"),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.graphic_eq,
                        color: Colors.black38,
                      ),
                      title: Text("Graph"),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.history,
                        color: Colors.black38,
                      ),
                      title: Text("History"),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black38,
                      ),
                      title: Text("Setting"),
                    )
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData();
}
