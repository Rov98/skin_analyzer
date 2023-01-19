import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/widgets/button/conditionButton.dart';

class ViewCondition extends StatefulWidget {
  ViewCondition({
    super.key,
    required this.condition,
  });
  List condition;

  @override
  State<ViewCondition> createState() => _ViewConditionState();
}

class _ViewConditionState extends State<ViewCondition> {
  late List<bool> _isSelected =
      List.generate(widget.condition.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ToggleButtons(
        isSelected: _isSelected,
        renderBorder: false,
        borderWidth: 5.0,
        selectedColor: Colors.white,
        fillColor: Colors.orange,
        color: Colors.red,
        onPressed: (index) {
          setState(() {
            _isSelected[index] = !_isSelected[index];
          });
          print(index);
        },
        children: [
          Icon(Icons.add),
          Icon(Icons.add_a_photo),
          Icon(Icons.add_alarm),
        ],
      ),
    ]);
  }
}

// List<Widget>.generate(
//       condition.length,
//       (index) => ConditionButton(
//         title: condition[index]['cons'].toString(),
//         score: condition[index]['score'] as int,
//       ),
//     )