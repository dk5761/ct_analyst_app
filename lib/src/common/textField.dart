import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String placeHolder;
  final bool isAnimatedLabel;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final Key? fieldKey;
  final bool hidden;

  const CustomTextFormField({
    Key? key,
    required this.placeHolder,
    this.controller,
    this.isAnimatedLabel = false,
    this.validator,
    this.onEditingComplete,
    this.textInputAction,
    this.keyboardType,
    this.autocorrect = false,
    this.fieldKey,
    this.hidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      cursorColor: darkHeaderTextColor,
      controller: controller,
      validator: validator,
      autocorrect: autocorrect,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: hidden,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: isAnimatedLabel ? null : placeHolder,
        labelText: isAnimatedLabel ? placeHolder : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: darkTextFieldFocusColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: darkTextEnableFocusColor),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: darkBorderColor),
        ),
      ),
    );
  }
}
