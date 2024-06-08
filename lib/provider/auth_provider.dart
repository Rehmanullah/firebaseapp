
import 'package:flutter/material.dart';
class MyAuthProvider extends ChangeNotifier{
  bool _isLogin = true;
  bool get isLogin => _isLogin;
  setIsLogin(){
    _isLogin = !_isLogin;
    notifyListeners();
  }
}