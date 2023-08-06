// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:web_portal/dashboard/presentation/pages/add_assets.dart';
// import 'package:web_portal/dashboard/presentation/pages/admin_page.dart';
// import 'package:web_portal/dashboard/presentation/pages/all_assets_screen.dart';
// import 'package:web_portal/dashboard/presentation/pages/assets_statistics.dart';
// import 'package:web_portal/dashboard/presentation/pages/assign_assets_to_employees.dart';
// import 'package:web_portal/dashboard/presentation/pages/assigned_employees.dart';
// import 'package:web_portal/dashboard/presentation/pages/dashboard_page.dart';
// import 'package:web_portal/dashboard/presentation/pages/first_floor.dart';
// import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
// import 'package:web_portal/dashboard/presentation/pages/un_assign_employees.dart';
// import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
// import 'package:web_portal/go_router/errer_page.dart';
// import 'package:web_portal/go_router/route_constant.dart';
// import '../authentication/presentation/pages/log_in_page.dart';
//
// class MyAppRouter {
//   GoRouter router = GoRouter(
//       routes: [
//         GoRoute(
//             name: MyAppRouteConstants.login,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: LoginScreen());
//             }, path: '/'),
//         GoRoute(
//             path: '/admin_page',
//             name: MyAppRouteConstants.adminPage,
//             pageBuilder: (context, state) {
//               return  MaterialPage(child: AdminPage());
//             }),
//         GoRoute(
//             path: '/dashboard',
//             name: MyAppRouteConstants.dashboard,
//             pageBuilder: (context, state) {
//               return const MaterialPage(
//                 child: DashboardPage(),
//               );
//             }),
//         GoRoute(
//             path: '/assets_statistics',
//             name: MyAppRouteConstants.assetsStatistics,
//             pageBuilder: (context, state) {
//               return MaterialPage(child: AssetsStatistics());
//             }),
//         GoRoute(
//             path: '/assign_asset_to_employees',
//             name: MyAppRouteConstants.assignAssetsToEmployees,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: AssignAssetsToEmployees());
//             }),
//         GoRoute(
//             path: '/add_asset',
//             name: MyAppRouteConstants.addAssets,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: AddAssets());
//             }),
//         GoRoute(
//             path: '/assigned_employees',
//             name: MyAppRouteConstants.assignedEmployees,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: AssignedEmployees());
//             }),
//         GoRoute(
//             path: '/un_assigned_employees',
//             name: MyAppRouteConstants.unAssignedEmployees,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: UnAssignedEmployees());
//             }),
//         GoRoute(
//             path: '/all_asset',
//             name: MyAppRouteConstants.allAsset,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: AllAssetScreen());
//             }),
//         GoRoute(
//             path: '/un_assigned_assets',
//             name: MyAppRouteConstants.unAssignedAssets,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: UnAssignedAssets());
//             }),
//         GoRoute(
//             path: '/first_floor_asset',
//             name: MyAppRouteConstants.firstFloorAsset,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: FirstFloorScreen());
//             }),
//         GoRoute(
//             path: '/second_floor_asset',
//             name: MyAppRouteConstants.secondFloorAsset,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: SecondFlorAsset());
//             }),
//         GoRoute(
//             path: '/error_page',
//             name: MyAppRouteConstants.errorPage,
//             pageBuilder: (context, state) {
//               return const MaterialPage(child: SecondFlorAsset());
//             }),
//       ],
//       errorPageBuilder: (context, state) {
//         return const MaterialPage(child: ErrorPage());
//       });
// }
