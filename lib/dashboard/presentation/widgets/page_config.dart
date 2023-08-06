

import 'package:web_portal/dashboard/presentation/widgets/page_keys.dart';
import 'package:web_portal/dashboard/presentation/widgets/page_path.dart';
import 'package:web_portal/dashboard/presentation/widgets/pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);
  static PageConfiguration loginPageConfig = const PageConfiguration(
      key: PageKeys.loginPageKey,
      path: PagePaths.loginPagePath,
      uiPage: Pages.loginPage);
}
