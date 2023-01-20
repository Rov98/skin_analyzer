import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class ConditionButton extends StatefulWidget {
  ConditionButton({
    super.key,
    required this.title,
    required this.score,
    required this.isSelected,
    required this.onPressed,
  });
  String title;
  int score;
  bool isSelected;
  VoidCallback onPressed;

  @override
  State<ConditionButton> createState() => _ConditionButtonState();
}

class _ConditionButtonState extends State<ConditionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.onPressed();
      },
      child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.isSelected ? Colors.orange : Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud,
                color: Colors.orange,
                size: 40,
              ),
              Text(
                '${widget.title} ${widget.score}',
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: AppTheme()
                    .themeData
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black, fontSize: 15),
              )
            ],
          )),
    );
  }
}
