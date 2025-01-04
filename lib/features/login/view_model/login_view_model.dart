import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // Add more logic to handle login success or error
  }
}
