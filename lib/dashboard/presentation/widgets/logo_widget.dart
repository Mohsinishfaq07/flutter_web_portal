import 'package:flutter/material.dart';

import '../../../colors.dart';

Container logoWidget(double width, double height, double fontsize) {
  // double radius = width / 2;
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient:  const LinearGradient(
            colors: [faddedGreen, brightGreen],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft)),
    child: Center(
      child:
        Image.asset("assets/images/png/zstore_logo - Copy.png",),
      // Text("Z", style: TextStyle(fontSize: fontsize, color: Colors.white)
      // ),
    ),
  );
}
