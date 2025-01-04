import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  get isAgreedToTerms => null;

  void signUp(String email, String password, String text) async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // Add more logic to handle signup success or error
  }

  void login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // Add more logic to handle login success or error
  }

  void setAgreedToTerms(bool bool) {}
}
