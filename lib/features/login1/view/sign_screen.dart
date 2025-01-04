import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triveni_3399/features/signin/view_model/signup_view_model.dart';
import 'package:triveni_3399/widget/button_widget.dart';
import 'package:triveni_3399/widget/input_text_field_widget.dart';
import 'package:triveni_3399/widget/text_button_widget.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign Up"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
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
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 32),
                    InputTextFieldWidget(
                      hintText: "Username*",
                      textEditingController: _usernameTextController,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      labelText: "",
                      textColor: Colors.black,
                      hintTextColor: Colors.black54,
                    ),
                    SizedBox(height: 16),
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
                    CheckboxListTile(
                      title: Text("I Read and agree to Terms & Conditions"),
                      value: viewModel.isAgreedToTerms,
                      onChanged: (bool? value) {
                        viewModel.setAgreedToTerms(value ?? false);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: viewModel.isLoading
                          ? CircularProgressIndicator()
                          : ButtonWidget(
                              buttonTitle: "SIGN UP",
                              onPressed: () {
                                viewModel.signUp(
                                  _usernameTextController.text,
                                  _emailTextController.text,
                                  _passwordTextController.text,
                                );
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
                          "Already have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButtonWidget(
                          buttonTitle: "Login",
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                          textColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                          onPressed: () {
                            // Handle Facebook signup
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                          onPressed: () {
                            // Handle Twitter signup
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
}
