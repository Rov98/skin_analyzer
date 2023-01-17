import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class TextQuestion extends StatelessWidget {
  TextQuestion({super.key, required this.questionTitle});
  String questionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5.0),
      child: Text(questionTitle,
      textAlign: TextAlign.left,
      style: AppTheme().themeData.textTheme.headlineLarge,
      ),
    );
  }
}