import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  final String buttonName;

  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Size? size;

  const PrimaryTextButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.color,
    this.size,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? Colors.black,
      ),
      child: Text(buttonName),
    );
  }
}
