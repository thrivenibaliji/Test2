import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  ButtonWidget({
    required this.buttonTitle,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}
