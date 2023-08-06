import 'package:flutter/material.dart';

import 'app_theme.dart';

class ContinueButton extends StatelessWidget {
  String text;
  Function() ontap;
  double? width;
  ContinueButton({
    Key? key,
    this.width,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 50,
        width: width ?? double.infinity,
        child: Container(
          decoration: AppTheme.roundedContainerDecoration
              .copyWith(color: AppTheme.primaryColor),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
