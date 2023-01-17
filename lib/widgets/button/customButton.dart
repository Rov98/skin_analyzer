import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.color,
      required this.textColor,
      required this.onPressed,
      required this.title,
      this.withPadding = true});
  Color color, textColor;
  VoidCallback onPressed;
  String title;
  bool withPadding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: withPadding
            ? const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0)
            : const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Text(
          title,
          style: AppTheme().themeData.textTheme.headlineLarge!.copyWith(
                color: textColor,
              ),
        ),
      ),
    );
  }
}
