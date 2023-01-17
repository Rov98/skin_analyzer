import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/widgets/button/conditionButton.dart';

class ViewCondition extends StatelessWidget {
  ViewCondition({super.key, required this.condition});
  List condition;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List<Widget>.generate(
      condition.length,
      (index) => ConditionButton(
        title: condition[index]['cons'].toString(),
        score: condition[index]['score'] as int,
      ),
    ));
  }
}
