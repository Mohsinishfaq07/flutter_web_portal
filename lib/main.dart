import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/dashboard/presentation/pages/admin_page.dart';
import 'package:web_portal/dashboard/presentation/pages/all_assets_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/assigned_employees.dart';
import 'package:web_portal/dashboard/presentation/pages/history_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/assets_statistics.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_employees.dart';
import 'authentication/presentation/pages/log_in_page.dart';
import 'dashboard/presentation/pages/add_assets.dart';
import 'dashboard/presentation/pages/assign_assets_to_employees.dart';
import 'dashboard/presentation/pages/dashboard_page.dart';
import 'dashboard/presentation/pages/delete_asset.dart';
import 'dashboard/presentation/widgets/routes.dart';
import 'dependency_container.dart' as di;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => DashboardProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context,"home");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ais Seat Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        Routes.login: (context) => const LoginScreen(),
        Routes.adminPage: (context) => const AdminPage(),
        Routes.dashboard: (context) => const DashboardPage(),
        Routes.assignedEmployees: (context) => const AssignedEmployees(),
        Routes.unAssignedEmployees: (context) => const UnAssignedEmployees(),
        Routes.assetsStatistics: (context) =>  AssetsStatistics(),
        Routes.secondFloorAsset: (context) => const SecondFlorAsset(),
        Routes.firstFloorAsset: (context) => const AllAssetScreen(),
        Routes.assignAssetsToEmployees: (context) => const AssignAssets(),
        Routes.addAssets: (context) => const AddAssets(),
        Routes.unAssignAssets: (context) => const UnAssignAsset(),
        Routes.deleteAsset: (context) => const DeleteAsset(),
        Routes.history: (context) => const HistoryScreen(),
      },
      home: const LoginScreen(),
    );
  }
}

// class MyMobileApp extends StatelessWidget {
//   const MyMobileApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Ais Seat Management System',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routes: {
//         Routes.login: (context) => LoginScreen(),
//         Routes.adminPage: (context) => const AdminPage(),
//         Routes.dashboard: (context) => DashboardPage(),
//         Routes.unAssignEmployees: (context) => UnAssignEmployees(),
//         Routes.assignEmployees: (context) => AssignedEmployees(),
//         Routes.DEPT_AGENTS: (context) => DepartmentAgents(),
//         Routes.assetsStatistics: (context) => AssetsStatistics(),
//       },
//       home: LoginScreen(),
//     );
//   }
// }
