import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class StatResult extends StatefulWidget {
  StatResult(
      {super.key,
      required this.result,
      required this.score,
      this.isPrimary = false});
  String result;
  int score;
  bool isPrimary;
  @override
  State<StatResult> createState() => _StatResultState();
}

class _StatResultState extends State<StatResult> {
  String? _status;
  Color? _colorStatus;

  void resultCount() {
    if (widget.score <= 25) {
      _status = 'Bad';
      _colorStatus = badColor;
    } else if (widget.score <= 75) {
      _status = 'Good';
      _colorStatus = goodColor;
    } else {
      _status = 'Perfect';
      _colorStatus = perfectColor;
    }
  }

  RichText _resultText(TextStyle ts, bool isAlign) {
    return RichText(
      textAlign: isAlign ? TextAlign.center : TextAlign.left,
      text: TextSpan(style: ts, children: [
        TextSpan(text: '${widget.result} '),
        TextSpan(
          text: _status,
          style: ts.copyWith(color: _colorStatus),
        )
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    resultCount();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPrimary
        ? Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: AppTheme().themeData.primaryColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-4, 6),
                    spreadRadius: -15,
                    blurRadius: 23,
                    color: Color.fromRGBO(155, 155, 155, 1),
                  )
                ]),
            child: ListTile(
              title: _resultText(
                  AppTheme()
                      .themeData
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 20),
                  false),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: widget.score / 100,
                    strokeWidth: 10,
                    color: _colorStatus,
                  ),
                  Text(
                    '${widget.score}',
                    style:
                        AppTheme().themeData.textTheme.headlineLarge!.copyWith(
                              color: _colorStatus,
                              fontSize: 20,
                            ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: AppTheme().themeData.primaryColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-4, 6),
                    spreadRadius: -15,
                    blurRadius: 23,
                    color: Color.fromRGBO(155, 155, 155, 1),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 50,
                        child: CircularProgressIndicator(
                          value: widget.score / 100,
                          strokeWidth: 10,
                          color: _colorStatus,
                        ),
                      ),
                      Text(
                        '${widget.score}',
                        style: AppTheme()
                            .themeData
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              color: _colorStatus,
                              fontSize: 20,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: _resultText(
                        AppTheme().themeData.textTheme.headlineLarge!, true),
                  ),
                ),
              ],
            ));
  }
}
