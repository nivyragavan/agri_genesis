import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Size fixedSize;
  final Color buttonColor;
  final BorderRadiusGeometry borderRadius;
  const CustomElevatedButtonWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.fixedSize,
      required this.buttonColor,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: fixedSize,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        onPressed: onPressed,
        child: child);
  }
}
