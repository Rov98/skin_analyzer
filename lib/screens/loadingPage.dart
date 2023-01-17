import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isSelected = false;

  @override
  void setState(VoidCallback fn) {
    //use mounted to check if the state is already dispose
    if (mounted) {
      super.setState(fn);
    }
  }

  void animationDelay() async {
    for (var i = 0; i <= 5; i++) {
      await Future.delayed(
        Duration(seconds: 1),
        () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    animationDelay();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainAppColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  AnimatedContainer(
                    margin: _isSelected
                        ? EdgeInsets.only(top: 10)
                        : EdgeInsets.only(top: 50),
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      'assets/item/brainstorming_flatline.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Mohon tunggu beberapa saat..\nSim salabim abracadabra!',
                  textAlign: TextAlign.center,
                  style: AppTheme()
                      .themeData
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
