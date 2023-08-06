
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum CustomScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();

  /* URL */

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  CustomScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);

    if (scrWidth > 890) {
      return CustomScreenType.web;
    } else if (scrWidth < 650) {
      return CustomScreenType.mobile;
    }

    return CustomScreenType.tab;
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');

    var response = await post(url,
            body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));

    print(response.body);

    return response.statusCode == 200;
  }
}
