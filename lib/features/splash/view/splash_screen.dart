import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/splash_screen.png', // Add your image to the assets folder
            fit: BoxFit.cover,
          ),
          // Gradient Overlay
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Title
              Text(
                "Welcome To FitKit UI Kit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              // Pagination Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(true),
                  _buildIndicator(false),
                  _buildIndicator(false),
                ],
              ),
              SizedBox(height: 20),
              // Skip and Next Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle Skip
                      // Navigate directly to SignUpScreen if needed
                      Navigator.of(context).pushReplacementNamed('/signup');
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Next
                      Navigator.of(context).pushReplacementNamed('/signup');
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.red : Colors.grey,
      ),
    );
  }
}
