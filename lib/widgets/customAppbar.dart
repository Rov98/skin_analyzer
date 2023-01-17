import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

AppBar CustomAppbar(String title,
    {bool centerTitle = true,
    required List<Widget> widgets,
    required Widget leading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: centerTitle,
    automaticallyImplyLeading: true,
    leading: leading,
    actions: widgets,
    title: Text(title, style: AppTheme().themeData.textTheme.bodyLarge),
  );
}
