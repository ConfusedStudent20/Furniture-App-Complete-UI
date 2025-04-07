import 'package:flutter/material.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  final String buttonName;

  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Size? size;

  const PrimaryOutlinedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.color,
    this.size,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color ?? Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: size ?? Size(300, 50),
      ),
      child: Text(buttonName),
    );
  }
}
