// import 'package:get/get.dart';
//
// import 'Navigator_keys.dart';
//
// class LocalNavigator extends GetxController {
//   static LocalNavigator instance = Get.find();
//
//   Future<dynamic> navigateTo(String routeName) {
//     return NavigatorKeys.dashboardNavigator.currentState!.pushNamed(routeName);
//   }
//
//   goBack() => NavigatorKeys.dashboardNavigator.currentState!.pop();
// }
import 'package:flutter/cupertino.dart';

import 'Navigator_keys.dart';

class LocalNavigator {
  static final LocalNavigator _instance = LocalNavigator._internal();

  factory LocalNavigator() {
    return _instance;
  }

  LocalNavigator._internal();

  Future<dynamic> navigateTo(String routeName) {
    return NavigatorKeys.dashboardNavigator.currentState!.pushNamed(routeName);
  }

  void goBack() {
    NavigatorKeys.dashboardNavigator.currentState!.pop();
  }
}
class NavigatorKeys {
  static final GlobalKey<NavigatorState> mainAppNavigator = GlobalKey();
  static final GlobalKey<NavigatorState> dashboardNavigator = GlobalKey();
}

LocalNavigator localNavigator = LocalNavigator();

