import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triveni_3399/features/signin/view_model/signup_view_model.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign Up"),
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0, // Remove AppBar shadow
            ),
            extendBodyBehindAppBar: true, // Extend body behind AppBar
            body: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Image.asset(
                  'assets/signup_screen (2).png', // Add your background image to the assets folder
                  fit: BoxFit.cover,
                ),
                // Gradient Overlay (Optional)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: deprecated_member_use
                      colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // Content
                Center(
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
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 32),
                        viewModel.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  // Call your action here
                                  viewModel.signUp("email", "name" ,"password");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 54, 244, 228), // Button color
                                ),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Handle login and navigate to LoginScreen
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                          child: Text(
                            "Log In With Account",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
