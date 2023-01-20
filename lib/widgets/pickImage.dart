import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';
import 'package:skin_tone_scanner/constant/constant.dart';
import 'package:skin_tone_scanner/screens/loadingPage.dart';
import 'package:skin_tone_scanner/screens/resultPage.dart';

class PickImage extends StatelessWidget {
  PickImage({
    super.key,
  });
  File? _ImageFile;

  Future<void> _imageProcessing(bool selectGallery, context) async {
    final imageFile = await ImagePicker().pickImage(
      source: selectGallery ? ImageSource.gallery : ImageSource.camera,
    );
    _ImageFile = File(imageFile!.path);

    //return null if the user back after selecting img
    if (_ImageFile == null) {
      return;
    }
    //check mounted first to avoid null value
    Navigator.of(context)
        .push(MaterialPageRoute(
          builder: (context) => resultPage(
            pickedImage: _ImageFile!,
          ),
        ))
        .whenComplete(() => Navigator.of(context).pop());
  }

  Widget _ItemOption(
      String title, subtitle, Icon icon, VoidCallback onPressed) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          onTap: onPressed,
          title:
              Text(title, style: AppTheme().themeData.textTheme.headlineLarge),
          subtitle: Text(subtitle),
          leading: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: mainAppColor,
            ),
            child: icon,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    _ImageFile = File('');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20.0).copyWith(
            top: 30.0,
            bottom: 5.0,
          ),
          child: Text(
            'Ambil Foto',
            style: AppTheme()
                .themeData
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 20),
          ),
        ),
        _ItemOption(
            'Ambil foto langsung dari kamera',
            'Ambil foto dari kamera hp kamu',
            const Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
            ),
            () => _imageProcessing(false, context)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
          child: Divider(
            color: Colors.grey,
            height: 2,
          ),
        ),
        _ItemOption(
          'Upload dari galeri',
          'Upload foto dari galeri foto kamu',
          const Icon(
            Icons.photo_rounded,
            color: Colors.white,
          ),
          () => _imageProcessing(true, context),
        ),
      ],
    );
  }
}
