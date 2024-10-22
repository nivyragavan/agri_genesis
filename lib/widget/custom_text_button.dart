import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomTextButtonWidget(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}
