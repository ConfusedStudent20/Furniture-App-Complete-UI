import 'package:flutter/material.dart';
import 'package:furniture_yt/cores/consts/colors.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final String buttonName;

  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Size? size;

  const PrimaryElevatedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.color,
    this.size,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? CommonColor.cElevatedButtonColor,
        foregroundColor: textColor ?? Colors.black,
        
        fixedSize: size ?? Size(300, 50),
      ),
      child: Text(buttonName),
    );
  }
}
