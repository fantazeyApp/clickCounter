import 'package:flutter/material.dart';

class GlobalState {
  final Map<String, TextEditingController> _data =
      <String, TextEditingController>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(String key, TextEditingController value) => _data[key] = value;
  get(String key) => _data[key];
}

final GlobalState store = GlobalState.instance;
