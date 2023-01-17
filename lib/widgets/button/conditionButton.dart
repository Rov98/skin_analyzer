import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class ConditionButton extends StatelessWidget {
  ConditionButton({super.key, required this.title, required this.score});
  String title;
  int score;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud,
                  color: Colors.orange,
                  size: 40,
                ),
                Text(
                  '$title $score',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: AppTheme()
                      .themeData
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black, fontSize: 15),
                )
              ],
            )));
  }
}
