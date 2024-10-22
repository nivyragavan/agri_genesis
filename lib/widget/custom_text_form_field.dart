import 'package:agri_genesis/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool? password;
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const CustomTextFormFieldWidget(
      {super.key,
      required this.controller,
      this.password = false,
      required this.hintText,
      this.suffixIcon,
      this.validator});

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.password == true ? !passwordVisible : false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: greyColor),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.password == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: !passwordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility))
              : null),
      validator: widget.validator,
    );
  }
}
