import 'package:flutter/material.dart';

class UsuarioInfo with ChangeNotifier {
  String _userInfo;
  String get userInfo => _userInfo;
  set userInfo(String value) {
    this._userInfo = value;
    notifyListeners();
  }
}
