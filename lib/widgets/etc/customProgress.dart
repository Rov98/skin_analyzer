import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class CustomProgress extends StatelessWidget {
  CustomProgress({super.key, required this.isComplete});
  bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: LinearProgressIndicator(
          value: isComplete? 1 : 0,
          backgroundColor: Colors.grey.shade200,
          color: mainAppColor,
        ),
      ),
    );
  }
}
