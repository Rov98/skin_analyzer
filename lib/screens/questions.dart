import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';
import 'package:skin_tone_scanner/widgets/button/customButton.dart';
import 'package:skin_tone_scanner/widgets/button/largeButton.dart';
import 'package:skin_tone_scanner/widgets/etc/customProgress.dart';
import 'package:skin_tone_scanner/widgets/etc/viewQuestion.dart';
import 'package:skin_tone_scanner/widgets/pickImage.dart';
import 'package:skin_tone_scanner/widgets/view/viewImagepicker.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  _cameraOption() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppTheme().themeData.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        builder: (context) => PickImage()).whenComplete(
      () => Navigator.of(context).pop(),
    );
  }

  bool _isResult = false;
  bool _isSelectedChipButton = false;
  int _questionsIndex = 0;

  void _buttonPress(int score, bool isSelected) {
    setState(() {
      isSelected = !isSelected;
    });
    print(score);
  }

  _nextQuestions() {
    setState(() {
      if (_questionsIndex >= 0) {
        _questionsIndex = _questionsIndex + 1;
      } else {
        _questionsIndex = 0;
      }
      _question[_questionsIndex]['isAnswered'] = true;
    });
    // print(_questionsIndex); debugging only
    // print(_question.length);
  }

  _backQuestions() {
    setState(() {
      if (_questionsIndex <= 0) {
        Navigator.of(context).pop();
      } else {
        _question[_questionsIndex]['isAnswered'] = false;
        _questionsIndex = _questionsIndex - 1;
      }
    });
    print(_questionsIndex);
    print(_question.length);
  }

  _toResult() {
    setState(() {
      _isResult = true;
    });
  }

  final _question = [
    {
      'questionsText': 'Bagaimana Kondisi Kulit Kamu?',
      'isAnswered': false,
      'answerText': [
        {'text': 'Normal', 'score': 10, 'isSelected': false},
        {'text': 'Kering', 'score': 10, 'isSelected': false},
        {'text': 'Berminyak', 'score': 10, 'isSelected': false},
        {'text': 'Sensitif', 'score': 10, 'isSelected': false},
        {'text': 'Kombinasi', 'score': 10, 'isSelected': false},
      ]
    },
    {
      'questionsText': 'Apa Masalah Utama Kulit Mu?',
      'isAnswered': false,
      'answerText': [
        {'text': 'Garis Halus & Kerutan', 'score': 10, 'isSelected': false},
        {'text': 'Kulit Kusam', 'score': 10, 'isSelected': false},
        {'text': 'Kemerahan', 'score': 10, 'isSelected': false},
        {'text': 'Pori - Pori Besar', 'score': 10, 'isSelected': false},
        {'text': 'Pigmentasi', 'score': 10, 'isSelected': false},
        {'text': 'Noda Kulit', 'score': 10, 'isSelected': false},
        {'text': 'Mata Bengkak', 'score': 10, 'isSelected': false},
        {'text': 'Dark Spots', 'score': 10, 'isSelected': false},
      ]
    },
    {
      'questionsText': 'Berapa Umur Kamu?',
      'isAnswered': false,
      'answerText': [
        {'text': '18-24 Tahun', 'score': 10, 'isSelected': false},
        {'text': '25-34 Tahun', 'score': 10, 'isSelected': false},
        {'text': '35-44 Tahun', 'score': 10, 'isSelected': false},
        {'text': '45-55 Tahun', 'score': 10, 'isSelected': false},
        {'text': '55+ Tahun', 'score': 10, 'isSelected': false},
      ]
    },
    {
      'questionsText': 'Dimana lokasi anda sering menghabiskan waktu?',
      'isAnswered': false,
      'condition': [
        {'cons': 'UV Index', 'score': 15, 'isSelected': false},
        {'cons': 'Humidity', 'score': 20, 'isSelected': false},
        {'cons': 'Pollution', 'score': 20, 'isSelected': false},
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _questionsIndex = 0;
    setState(() {
      _question[_questionsIndex]['isAnswered'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var asnwerText = _question[_questionsIndex]['answerText'];
    var conditionText = _question[_questionsIndex]['condition'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: List<Widget>.generate(
                      _question.length,
                      (index) {
                        return Expanded(
                          child: CustomProgress(
                              isComplete:
                                  _question[index]['isAnswered'] as bool),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _isResult
                      ? Expanded(child: ViewImagePicker())
                      : Expanded(
                          child: ViewQuestion(
                              questions: asnwerText != null
                                  ? asnwerText as List<Map<String, Object>>
                                  : [
                                      {'': ''}
                                    ],
                              questionsTitle: _question[_questionsIndex]
                                      ['questionsText']
                                  .toString(),
                              condition: conditionText != null
                                  ? conditionText as List
                                  : [],
                              onPress: _buttonPress),
                        ),
                ],
              ),
            )),
        _isResult
            ? Expanded(
                flex: 0,
                child: Column(
                  children: [
                    LargeButton(title: 'Ambil Foto', onPressed: _cameraOption),
                  ],
                ),
              )
            : Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                          color: AppTheme().themeData.primaryColor,
                          textColor: mainAppColor,
                          onPressed: _backQuestions,
                          title: _questionsIndex == 0 ? 'Batalkan' : 'Kembail'),
                      CustomButton(
                          color: mainAppColor,
                          textColor: AppTheme().themeData.primaryColor,
                          onPressed: _questionsIndex == _question.length - 1
                              ? _toResult
                              : _nextQuestions,
                          title: 'Lanjutkan'),
                    ],
                  ),
                ),
              ),
        const SizedBox(
          height: 35.0,
        )
      ],
    );
  }
}
