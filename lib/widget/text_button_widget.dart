
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key, required this.buttonTitle, required this.onPressed, required Color textColor});
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: Color.fromARGB(255, 63, 253, 107)),
        ));
  }
}
