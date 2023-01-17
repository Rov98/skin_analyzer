import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/screens/loadingPage.dart';
import 'package:skin_tone_scanner/widgets/statResult.dart';

class resultPage extends StatefulWidget {
  resultPage({super.key, required this.pickedImage});
  File pickedImage;

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  bool isLoading = true;

  //only using delay for loading, better use futurebuilder in the future;
  void _onDelay() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onDelay();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingPage()
        : SafeArea(
            child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.file(
                      File(widget.pickedImage.path),
                    ).image,
                    fit: BoxFit.cover),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Stack(
                  children: [
                    DraggableScrollableSheet(
                      initialChildSize: 0.3,
                      minChildSize: 0.1,
                      maxChildSize: 1.0,
                      builder: (context, scrollController) => Container(
                        decoration: BoxDecoration(
                          color: AppTheme().themeData.primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 50,
                                  height: 5,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              StatResult(
                                  result: 'Your Overall Skin Score is',
                                  score: 50,
                                  isPrimary: true),
                              Container(
                                child: GridView(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  shrinkWrap: true,
                                  controller: ScrollController(),
                                  children: [
                                    StatResult(
                                        result:
                                            'Your Uneven Skintone Skin Score is',
                                        score: 60),
                                    StatResult(
                                        result: 'Your Smoothness Skin Score is',
                                        score: 60),
                                    StatResult(
                                        result: 'Your Radiance Skin Score is',
                                        score: 50),
                                    StatResult(
                                        result: 'Your Dryness Skin Score is',
                                        score: 30),
                                    StatResult(
                                        result: 'Your Moisturize Skin Score is',
                                        score: 100),
                                    StatResult(
                                        result: 'Your Wrinkles Skin Score is',
                                        score: 20),
                                    StatResult(
                                        result:
                                            'Your Dark Circles in Skin Score is',
                                        score: 60),
                                    StatResult(
                                        result: 'Your Texture Skin Score is',
                                        score: 90),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
