import 'package:flutter/material.dart';

class SignViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool _isAgreedToTerms = false;

  bool get isLoading => _isLoading;
  bool get isAgreedToTerms => _isAgreedToTerms;

  void setAgreedToTerms(bool value) {
    _isAgreedToTerms = value;
    notifyListeners();
  }

  void signUp(String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // Add logic to handle signup success or error
  }
}
