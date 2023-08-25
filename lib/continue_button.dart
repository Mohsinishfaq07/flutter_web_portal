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
        width: width ?? double.infinity,
        child: Container(height: 50,
          decoration: AppTheme.roundedContainerDecoration
              .copyWith(color: AppTheme.primaryColor),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
