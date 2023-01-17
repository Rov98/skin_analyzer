import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';
import 'package:skin_tone_scanner/widgets/button/customButton.dart';

class ViewImagePicker extends StatelessWidget {
  const ViewImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Ambil Foto Selfie Anda',
                  style: AppTheme().themeData.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Tunjukan Pesona Kelembapan kulit Kamu!',
                  style: AppTheme().themeData.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/item/Camera_Flatline_1.png'),
                        fit: BoxFit.contain),
                  ),
                  child: Text(
                      'Untuk Hasil yang Maksimal pastikan anda berada di tempat dengan pencahayaan yang cukup',
                      textAlign: TextAlign.center,
                      style: AppTheme()
                          .themeData
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                      overflow: TextOverflow.clip),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//assets\item\Camera_Flatline_1.png