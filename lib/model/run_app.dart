import 'package:click_counter/main.dart';
import 'package:flutter/material.dart';

//<-- Тренировка на кошках)) -->
abstract class IApp {
  const IApp();
  Widget makeApp();
}

class AppDefault implements IApp {
  const AppDefault();
  @override
  Widget makeApp() => const App();
}

abstract class IAppFactory {
  const IAppFactory();
  IApp createApp();
}

class AppFactory implements IAppFactory {
  const AppFactory();
  @override
  IApp createApp() => const AppDefault();
}

class MainSetup {
  final IAppFactory _factory;
  late final IApp _app;

  MainSetup(this._factory) {
    _app = _factory.createApp();
  }

  Widget makeApp() => _app.makeApp();
}
