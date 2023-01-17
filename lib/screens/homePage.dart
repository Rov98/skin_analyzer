import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/widgets/customAppbar.dart';
import 'package:skin_tone_scanner/widgets/view/carouselView.dart';
import 'package:skin_tone_scanner/constant/constant.dart';
import 'package:skin_tone_scanner/screens/questions.dart';
import 'package:skin_tone_scanner/widgets/text/textBanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _showQuestion(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      backgroundColor: AppTheme().themeData.primaryColor,
      builder: (context) => Questions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/background/potrait_bckground_skin_analyzer.png'),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppbar(
              appName,
              widgets: [],
              leading: IconButton(
                  onPressed: () {
                    SystemNavigator.pop(); //android safely exit
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  )),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(
                  flex: 4,
                ),
                Expanded(
                    flex: 1,
                    child: CarouselView(
                      listWidget: [
                        TextBanner(
                            title: 'Analisa Kondisi Kulit Kamu',
                            subtitle: 'Lorem Ipsum Diolor'),
                        TextBanner(
                            title: 'Lihat kesehatan kulitmu',
                            subtitle: 'Lorem Ipsum Diolor'),
                        TextBanner(
                            title: 'Nilai Kualitas kulitmu',
                            subtitle: 'Lorem Ipsum Diolor'),
                      ],
                    )),
                Expanded(
                  flex: 0,
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: AppTheme().themeData.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(10.0)),
                            backgroundColor:
                                MaterialStateProperty.all(mainAppColor),
                          ),
                          onPressed: () => _showQuestion(context),
                          icon: Icon(Icons.face_rounded),
                          label: const Text('Mulai Sekarang'))),
                )
              ],
            ),
          )),
    );
  }
}
