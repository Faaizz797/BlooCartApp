import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier { 
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  String _savedEmail = "";
  
  String get savedEmail => _savedEmail;

  void savedEmailUser(String emailUser) {
    _savedEmail = emailUser;
    notifyListeners();
  }

  AuthProvider() {
    loadAuth();
  }

  // untuk handle konfigurasi perubahan tema secara lokal
  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    // setbool => key & value
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // getbool => key aja
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }
}