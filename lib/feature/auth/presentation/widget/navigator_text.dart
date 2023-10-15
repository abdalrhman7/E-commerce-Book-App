import 'package:flutter/material.dart';

class NavigatorText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  const NavigatorText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
        )
      ],
    );
  }
}