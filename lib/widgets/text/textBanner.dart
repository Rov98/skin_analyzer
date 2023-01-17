import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class TextBanner extends StatelessWidget {
  TextBanner({super.key, required this.title, required this.subtitle});
  String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTheme().themeData.textTheme.titleMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            subtitle,
            style: AppTheme().themeData.textTheme.bodyMedium!.copyWith(fontSize: 15),
          ),
        )
      ],
    );
  }
}
