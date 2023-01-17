import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/widgets/button/chipButton.dart';
import 'package:skin_tone_scanner/widgets/pickLocation.dart';
import 'package:skin_tone_scanner/widgets/text/textQuestion.dart';
import 'package:skin_tone_scanner/widgets/view/viewCondition.dart';

class ViewQuestion extends StatelessWidget {
  ViewQuestion({
    super.key,
    required this.questions,
    required this.questionsTitle,
    required this.onPress,
    required this.condition,
  });
  List<Map<String, Object>> questions;
  List condition;
  String questionsTitle;
  Function onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextQuestion(questionTitle: questionsTitle),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              ...questions
                  .map(
                    (e) => e['text'] != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5.0),
                            child: ChipButton(
                              title: e['text'].toString(),
                              isSelected: e['isSelected'] as bool,
                              save: () => onPress(e['score'] as int, e['isSelected'] as bool),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5.0),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                PickLocation(),
                                const SizedBox(
                                  height: 10,
                                ),
                                ViewCondition(condition: condition),
                              ],
                            ),
                          ),
                  )
                  .toList()
            ],
          ),
        ),
      ],
    );
  }
}
