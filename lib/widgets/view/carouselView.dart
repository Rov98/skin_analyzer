import 'package:flutter/material.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class CarouselView extends StatefulWidget {
  CarouselView({super.key, required this.listWidget});
  List<Widget> listWidget;

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  int activePage = 0;

  _showCarouselBullet(int length, currIndex) {
    return length != null
        ? List<Widget>.generate(
            length,
            (index) => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currIndex == index ? mainAppColor : Colors.white
                  ),
                ))
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) => setState(() {
              activePage = value;
            }),
            itemCount: widget.listWidget.length,
            itemBuilder: (context, index) => widget.listWidget[index],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _showCarouselBullet(widget.listWidget.length, activePage),
          ),
        ),
      ],
    );
  }
}
