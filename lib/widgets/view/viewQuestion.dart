import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/widgets/button/chipButton.dart';
import 'package:skin_tone_scanner/widgets/pickLocation.dart';
import 'package:skin_tone_scanner/widgets/text/textQuestion.dart';
import 'package:skin_tone_scanner/widgets/view/viewCondition.dart';

class ViewQuestion extends StatefulWidget {
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
  State<ViewQuestion> createState() => _ViewQuestionState();
}

class _ViewQuestionState extends State<ViewQuestion> {
  bool _ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextQuestion(questionTitle: widget.questionsTitle),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              ...widget.questions
                  .map(
                    (e) => e['text'] != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5.0),
                            child: ChipButton(
                              title: e['text'].toString(),
                              isSelected: _ispressed,
                              save: () => widget.onPress(e['score'] as int),
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
                                ViewCondition(
                                  condition: widget.condition,
                                ),
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
