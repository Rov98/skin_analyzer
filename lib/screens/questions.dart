import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';
import 'package:skin_tone_scanner/widgets/button/customButton.dart';
import 'package:skin_tone_scanner/widgets/button/largeButton.dart';
import 'package:skin_tone_scanner/widgets/etc/customProgress.dart';
import 'package:skin_tone_scanner/widgets/view/viewQuestion.dart';
import 'package:skin_tone_scanner/widgets/pickImage.dart';
import 'package:skin_tone_scanner/widgets/view/viewImagepicker.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool _isResult = false;
  int _questionsIndex = 0;
  int _totalScore = 0;

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
            builder: (context) => PickImage())
        .onError((error, stackTrace) => error.toString());
  }

  void _buttonPress(int score) {
    _totalScore = _totalScore + score;
    print(_totalScore);
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
    // print(_questionsIndex); do it in debug only
    // print(_question.length);
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
        {
          'text': 'Normal',
          'score': 80,
        },
        {
          'text': 'Kering',
          'score': 40,
        },
        {
          'text': 'Berminyak',
          'score': 60,
        },
        {
          'text': 'Sensitif',
          'score': 40,
        },
        {
          'text': 'Kombinasi',
          'score': 50,
        },
      ]
    },
    {
      'questionsText': 'Apa Masalah Utama Kulit Mu?',
      'isAnswered': false,
      'answerText': [
        {
          'text': 'Garis Halus & Kerutan',
          'score': 60,
        },
        {
          'text': 'Kulit Kusam',
          'score': 40,
        },
        {
          'text': 'Kemerahan',
          'score': 50,
        },
        {
          'text': 'Pori - Pori Besar',
          'score': 60,
        },
        {
          'text': 'Pigmentasi',
          'score': 30,
        },
        {
          'text': 'Noda Kulit',
          'score': 60,
        },
        {
          'text': 'Mata Bengkak',
          'score': 10,
        },
        {
          'text': 'Dark Spots',
          'score': 50,
        },
      ]
    },
    {
      'questionsText': 'Berapa Umur Kamu?',
      'isAnswered': false,
      'answerText': [
        {
          'text': '18-24 Tahun',
          'score': 80,
        },
        {
          'text': '25-34 Tahun',
          'score': 60,
        },
        {
          'text': '35-44 Tahun',
          'score': 40,
        },
        {
          'text': '45-55 Tahun',
          'score': 20,
        },
        {
          'text': '55+ Tahun',
          'score': 5,
        },
      ]
    },
    {
      'questionsText': 'Dimana lokasi anda sering menghabiskan waktu?',
      'isAnswered': false,
      'condition': [
        {
          'cons': 'UV Index',
          'score': 15,
        },
        {
          'cons': 'Humidity',
          'score': 20,
        },
        {
          'cons': 'Pollution',
          'score': 50,
        },
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
                            isComplete: _question[index]['isAnswered'] as bool),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _isResult
                    ? const Expanded(child: ViewImagePicker())
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
                              ? conditionText as List<Map<String, Object>>
                              : [],
                          onPress: _buttonPress,
                        ),
                      ),
              ],
            ),
          ),
        ),
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
                flex: 0,
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
