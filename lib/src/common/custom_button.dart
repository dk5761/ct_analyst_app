import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final BoxConstraints? constraints;
  final EdgeInsets padding;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.constraints,
    this.padding = const EdgeInsets.all(9),
    this.backgroundColor = darkButtonBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints != null ? constraints! : const BoxConstraints(),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: darkBorderColor),
            ),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(label),
        ),
      ),
    );
  }
}
