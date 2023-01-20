import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/widgets/button/conditionButton.dart';

class ViewCondition extends StatelessWidget {
  ViewCondition(
      {super.key,
      required this.condition,
      required this.isSelected,
      required this.onPressed});
  List condition;
  bool isSelected;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List<Widget>.generate(
      condition.length,
      (index) => ConditionButton(
        title: condition[index]['cons'].toString(),
        score: condition[index]['score'] as int,
        onPressed: () => onPressed(condition[index]['score'] as int),
        isSelected: isSelected,
      ),
    ));
  }
}
