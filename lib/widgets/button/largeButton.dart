import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class LargeButton extends StatelessWidget {
  LargeButton({super.key, required this.title, required this.onPressed});
  String title;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(mainAppColor),
          ),
          icon: const Icon(
            Icons.camera_alt_rounded,
            color: Colors.white,
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              title,
              style: AppTheme()
                  .themeData
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
