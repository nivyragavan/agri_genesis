import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.fontColor,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textAlign,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily ?? "Inter",
          fontStyle: fontStyle),
    );
  }
}
