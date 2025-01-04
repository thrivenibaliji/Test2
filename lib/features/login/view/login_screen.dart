import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triveni_3399/features/login/view_model/login_view_model.dart';
import 'package:triveni_3399/routes/routes_constants.dart';
import 'package:triveni_3399/service/navigation_services.dart';
import 'package:triveni_3399/widget/button_widget.dart';
import 'package:triveni_3399/widget/input_text_field_widget.dart';
import 'package:triveni_3399/widget/text_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back
                },
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FitKit",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Welcome! Sign into Your Account.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 32),
                    InputTextFieldWidget(
                      hintText: "Email Id*",
                      textEditingController: _emailTextController,
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      labelText: "",
                      textColor: Colors.black,
                      hintTextColor: Colors.black54,
                    ),
                    SizedBox(height: 16),
                    InputTextFieldWidget(
                      hintText: "Password*",
                      textEditingController: _passwordTextController,
                      obscureText: !_isPasswordVisible,
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      labelText: "",
                      textColor: Colors.black,
                      hintTextColor: Colors.black54,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButtonWidget(
                        buttonTitle: "Forgot Password?",
                        onPressed: () {},
                        textColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: viewModel.isLoading
                          ? CircularProgressIndicator()
                          : ButtonWidget(
                              buttonTitle: "LOGIN",
                              onPressed: () {
                                // Handle login action here
                                loginAction();
                              },
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButtonWidget(
                          buttonTitle: "Signup",
                          onPressed: () {
                            // Navigate to Sign Up screen
                            Navigator.of(context).pushReplacementNamed('/signup');
                          },
                          textColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    // Social media icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                          onPressed: () {
                            // Handle Twitter login
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void loginAction() {
    // Dummy login action
    String email = _emailTextController.text;
    String password = _passwordTextController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Navigate to home screen
      NavigationServices().replaceAll(RoutesConstants.homeScreen);
    } else {
      // Show error message
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text("Please enter email and password")),
        );
    }
  }
}
