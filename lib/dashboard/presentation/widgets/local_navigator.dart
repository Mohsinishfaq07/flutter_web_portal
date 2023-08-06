import 'package:get/get.dart';

import 'Navigator_keys.dart';

class LocalNavigator extends GetxController {
  static LocalNavigator instence = Get.find();

  Future<dynamic> navigateTo(String routeName) {
    return NavigatorKeys.dashboardNavigator.currentState!.pushNamed(routeName);
  }

  goBack() => NavigatorKeys.dashboardNavigator.currentState!.pop();
}
