import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:web_portal/dashboard/presentation/pages/admin_page.dart';
import 'package:web_portal/dashboard/presentation/pages/all_assets_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/assigned_employees.dart';
import 'package:web_portal/dashboard/presentation/pages/create_scrap_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/history_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/scrap_recovered.dart';
import 'package:web_portal/dashboard/presentation/pages/scrap_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/assets_statistics.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_employees.dart';
import 'authentication/presentation/manager/auth_provider.dart';
import 'authentication/presentation/pages/log_in_page.dart';
import 'dashboard/presentation/manager/dashboard_provider.dart';
import 'dashboard/presentation/pages/add_assets.dart';
import 'dashboard/presentation/pages/assign_assets_to_employees.dart';
import 'dashboard/presentation/pages/dashboard_page.dart';
import 'dashboard/presentation/pages/delete_asset.dart';
import 'dashboard/presentation/widgets/custom_scroll_configuration.dart';
import 'dashboard/presentation/widgets/routes.dart';
import 'dependency_container.dart' as di;
import 'package:flutter/services.dart' show PlatformException;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialLink = await getInitialLink();
  await di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child:   MyApp(initialLink),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? initialLink;

  const MyApp(this.initialLink, {super.key});

  String parseInitialLinkAndDetermineRoute(String? initialLink) {
    // Implement the logic to parse the initialLink and determine the appropriate route
    // For example:
    if (initialLink == null) {
      return Routes.login; // Default route if no deep link
    } else if (initialLink.contains('admin')) {
      return Routes.adminPage;
    } else if (initialLink.contains('dashboard')) {
      return Routes.dashboard;
    }
    // Add more conditions for other deep link scenarios
    return Routes.login; // Default route if deep link doesn't match any condition
  }
  @override
  Widget build(BuildContext context) {
    final routeName = parseInitialLinkAndDetermineRoute(initialLink);
    //
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // final isDarkTheme = themeProvider.isDarkTheme;
    return MaterialApp(
      initialRoute: routeName,
      scrollBehavior: CustomNoGlowScrollBehavior().copyWith(scrollbars: true),
      debugShowCheckedModeBanner: false,
      title: 'Ais Seat Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade800),
        useMaterial3: true,
      ),
      routes: {
        Routes.login: (context) => const LoginScreen(),
        Routes.adminPage: (context) => const AdminPage(),
        Routes.dashboard: (context) => const DashboardPage(),
        Routes.assignedEmployees: (context) => const AssignedEmployees(),
        Routes.unAssignedEmployees: (context) => const UnAssignedEmployees(),
        Routes.assetsStatistics: (context) => const AssetsStatistics(),
        Routes.secondFloorAsset: (context) => const SecondFlorAsset(),
        Routes.firstFloorAsset: (context) => const AllAssetScreen(),
        Routes.assignAssetsToEmployees: (context) => const AssignAssets(),
        Routes.addAssets: (context) => const AddAssets(),
        Routes.unAssignAssets: (context) => const UnAssignAsset(),
        Routes.deleteAsset: (context) => const DeleteAsset(),
        Routes.history: (context) => const HistoryScreen(),
        Routes.scrapAssets: (context) => const ScrapScreen(),
        Routes.createScrap: (context) => const CreateScrapScreen(),
        Routes.scrapRecovered: (context) => const ScrapRecoveredScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
