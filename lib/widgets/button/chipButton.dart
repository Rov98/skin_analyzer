import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class ChipButton extends StatefulWidget {
  ChipButton({
    super.key,
    required this.title,
    required this.save,
    required this.isSelected,
  });
  String title;
  VoidCallback save;
  bool isSelected;

  @override
  State<ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.save();
      },
      style: ButtonStyle(
        backgroundColor: widget.isSelected
            ? MaterialStateProperty.all(mainAppColor)
            : MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: mainAppColor, width: 1),
          ),
        ),
      ),
      child: Text(
        widget.title,
        style: AppTheme().themeData.textTheme.titleMedium!.copyWith(
              color: mainAppColor,
            ),
      ),
    );
  }
}
