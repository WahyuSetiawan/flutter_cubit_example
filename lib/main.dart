import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: Scaffold(
            // appBar: AppBar(title: const Text("BON")),
            body: Text("BON - Borju on note "),
            bottomNavigationBar: BottomNavigationBar(
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
          ),
        ),
      ),
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData();
}
