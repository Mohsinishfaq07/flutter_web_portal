import 'package:flutter/material.dart';
import 'package:web_portal/dashboard/presentation/pages/add_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/assign_assets_to_employees.dart';
import 'package:web_portal/dashboard/presentation/pages/all_assets_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/delete_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/history_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/first_floor.dart';
import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../colors.dart';
import '../widgets/Navigator_keys.dart';
import '../widgets/routes.dart';
import 'un_assign_employees.dart';
import 'assigned_employees.dart';
import 'custom_animated_drawer.dart';
import 'dashboard_page.dart';
import 'assets_statistics.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}
class _AdminPageState extends State<AdminPage> {
  bool isDrawerOpen = false;
  void toggleDrawer() {
    if (MediaQuery.of(context).size.width <= 500) {
      setState(() {
        isDrawerOpen = !isDrawerOpen;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: Colors.grey.shade700,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                  height: _size.width > 1200
                      ? 43
                      : _size.width > 1000
                          ? 43
                          : _size.width > 900
                              ? 43
                              : _size.width > 800
                                  ? 43
                                  : _size.width > 750
                                      ? 43
                                      : _size.width > 700
                                          ? 42
                                          : _size.width > 650
                                              ? 42
                                              : _size.width > 600
                                                  ? 41
                                                  : _size.width > 550
                                                      ? 41
                                                      : _size.width > 500
                                                          ? 0
                                                          : _size.width > 450
                                                              ? 0
                                                              : _size.width >
                                                                      400
                                                                  ? 0
                                                                  : 0,
                  child: Image.asset(
                    "assets/images/png/ic_ais_logo.png",
                    color: Colors.white,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                "App In Snap ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _size.width > 1400
                      ? 27
                      : _size.width > 1350
                          ? 26
                          : _size.width > 1300
                              ? 25
                              : _size.width > 1250
                                  ? 24
                                  : _size.width > 1200
                                      ? 23
                                      : _size.width > 1150
                                          ? 22
                                          : _size.width > 1100
                                              ? 21
                                              : _size.width > 1050
                                                  ? 20
                                                  : _size.width > 1000
                                                      ? 19
                                                      : _size.width > 950
                                                          ? 18
                                                          : _size.width > 900
                                                              ? 17
                                                              : _size.width >
                                                                      850
                                                                  ? 16
                                                                  : _size.width >
                                                                          800
                                                                      ? 15
                                                                      : _size.width >
                                                                              750
                                                                          ? 14
                                                                          : _size.width > 700
                                                                              ? 13
                                                                              : _size.width > 650
                                                                                  ? 12
                                                                                  : _size.width > 600
                                                                                      ? 12
                                                                                      : _size.width > 550
                                                                                          ? 12
                                                                                          : _size.width > 500
                                                                                              ? 0
                                                                                              : _size.width > 450
                                                                                                  ? 0
                                                                                                  : _size.width > 400
                                                                                                      ? 0
                                                                                                      : _size.width > 350
                                                                                                          ? 0
                                                                                                          : 0,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.010,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isDrawerOpen = !isDrawerOpen;
                  });
                },
                child:  Icon(
                  Icons.menu,
                  color: primaryColor,
                size:  _size.width > 1400
                      ? 27
                      : _size.width > 1350
                      ? 27
                      : _size.width > 1300
                      ? 27
                      : _size.width > 1250
                      ? 27
                      : _size.width > 1200
                      ? 27
                      : _size.width > 1150
                      ? 27
                      : _size.width > 1100
                      ? 27
                      : _size.width > 1050
                      ? 27
                      : _size.width > 1000
                      ? 27
                      : _size.width > 950
                      ? 27
                      : _size.width > 900
                      ? 27
                      : _size.width > 850
                      ? 27
                      : _size.width > 800
                      ? 27
                      : _size.width > 750
                      ? 27
                      : _size.width > 700
                      ? 27
                      : _size.width > 650
                      ? 27
                      : _size.width > 600
                      ? 27
                      : _size.width > 550
                      ? 27
                      : _size.width > 500
                      ? 27
                      : _size.width > 450
                      ? 0
                      : _size.width > 400
                      ? 0
                      : _size.width > 350
                      ? 0
                      : 0,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              Text("Ais Seat Management System",
                  style: TextStyle(
                      fontSize: _size.width > 1400
                          ? 27
                          : _size.width > 1350
                              ? 26
                              : _size.width > 1300
                                  ? 25
                                  : _size.width > 1250
                                      ? 24
                                      : _size.width > 1200
                                          ? 24
                                          : _size.width > 1150
                                              ? 24
                                              : _size.width > 1100
                                                  ? 23
                                                  : _size.width > 1050
                                                      ? 22
                                                      : _size.width > 1000
                                                          ? 22
                                                          : _size.width > 950
                                                              ? 21
                                                              : _size.width >
                                                                      900
                                                                  ? 21
                                                                  : _size.width >
                                                                          850
                                                                      ? 20
                                                                      : _size.width >
                                                                              800
                                                                          ? 19
                                                                          : _size.width > 750
                                                                              ? 18
                                                                              : _size.width > 700
                                                                                  ? 17
                                                                                  : _size.width > 650
                                                                                      ? 16
                                                                                      : _size.width > 600
                                                                                          ? 16
                                                                                          : _size.width > 550
                                                                                              ? 16
                                                                                              : _size.width > 500
                                                                                                  ? 18
                                                                                                  : _size.width > 450
                                                                                                      ? 20
                                                                                                      : _size.width > 400
                                                                                                          ? 20
                                                                                                          : _size.width > 350
                                                                                                              ? 6
                                                                                                              : 0,
                      color: primaryColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            Row(
              children: [
                Text("Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),color: Colors.white),
                    child: const Icon(Icons.person_pin)),
                SizedBox(width: 20,),

                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkWell(
                    onTap: (){

                      Navigator.pushReplacementNamed(context, Routes.login);

                    },
                    child: const Icon(Icons.logout,color: primaryColor,)),
          ),
              ],
            )],
        ),
      ),
      endDrawer: _size.width <= 500
          ? Drawer(
              // Define your drawer content here
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: Text('Menu Item 1'),
                    onTap: () {
                      // Handle menu item click
                    },
                  ),
                  ListTile(
                    title: Text('Menu Item 2'),
                    onTap: () {
                      // Handle menu item click
                    },
                  ),
                  // Add more menu items as needed
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          // if (_size.width >= 100)
          if (_size.width > 500 && isDrawerOpen)
            Expanded(
              flex: 2,
              child: CustomAnimatedDrawer(
                toggleDrawer: () {},
              ),
            ),
          Expanded(
            flex: isDrawerOpen ? 8 : 12,
            child: Navigator(
              key: NavigatorKeys.dashboardNavigator,
              initialRoute: Routes.dashboard,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case Routes.dashboard:
                    return _getPageRoute(const DashboardPage());
                  case Routes.assignedEmployees:
                    return _getPageRoute(const AssignedEmployees());
                  case Routes.unAssignedEmployees:
                    return _getPageRoute(const UnAssignedEmployees());
                  case Routes.allAsset:
                    return _getPageRoute(const AllAssetScreen());
                  case Routes.unAssignedAssets:
                    return _getPageRoute(const UnAssignedAssets());
                  case Routes.firstFloorAsset:
                    return _getPageRoute(const FirstFloorScreen());
                  case Routes.secondFloorAsset:
                    return _getPageRoute(const SecondFlorAsset());
                  case Routes.assetsStatistics:
                    return _getPageRoute(AssetsStatistics());
                  case Routes.assignAssetsToEmployees:
                    return _getPageRoute(const AssignAssets());
                  case Routes.addAssets:
                    return _getPageRoute(const AddAssets());
                    case Routes.unAssignAssets:
                    return _getPageRoute(const UnAssignAsset());
                    case Routes.deleteAsset:
                    return _getPageRoute(const DeleteAsset());
                    case Routes.history:
                    return _getPageRoute(const HistoryScreen());
                  default:
                    return _getPageRoute(const DashboardPage());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
