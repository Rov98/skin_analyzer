import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/apptheme/appTheme.dart';

class PickLocation extends StatelessWidget {
  PickLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: AppTheme().themeData.primaryColor,
        border: const Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: TextButton.icon(
          onPressed: () {},
          style: const ButtonStyle(alignment: Alignment.centerLeft),
          icon: const Icon(Icons.location_on_rounded),
          label: Text('Bandung, Jawa Barat')),
    );
  }
}
