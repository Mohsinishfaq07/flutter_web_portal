import 'package:flutter/material.dart';

import '../../../colors.dart';

Padding HorizontalLine(double verticalpadding) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: verticalpadding),
    child: Container(
      height: 2,
      color: whiteBackground,
      width: double.infinity,
    ),
  );
}
