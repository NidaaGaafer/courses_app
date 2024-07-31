import 'package:flutter/material.dart';

class BuildCarsourelIndecator extends StatelessWidget {
  final int imageNum;
  final int currentImage;
  const BuildCarsourelIndecator({
    super.key,
    required this.imageNum,
    required this.currentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imageNum; i++)
          Container(
            margin: EdgeInsets.all(3),
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                color: i == currentImage ? Colors.amber : Colors.grey,
                borderRadius: BorderRadius.circular(2)),
          )
      ],
    );
  }
}
