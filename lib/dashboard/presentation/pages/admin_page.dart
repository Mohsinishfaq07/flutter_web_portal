import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// test
import 'package:responsive_builder/responsive_builder.dart';
 import 'package:web_portal/dashboard/presentation/pages/add_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/assign_assets_to_employees.dart';
import 'package:web_portal/dashboard/presentation/pages/all_assets_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/create_scrap_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/delete_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/history_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/scrap_recovered.dart';
import 'package:web_portal/dashboard/presentation/pages/scrap_screen.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/first_floor.dart';
import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../app_theme.dart';
import '../../../authentication/presentation/manager/auth_provider.dart';
import '../../../colors.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/local_navigator.dart';
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
  final GlobalKey<FormState> _webPageKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _tabPageKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobilePageKey = GlobalKey<FormState>();

  bool isDrawerOpen = true;
  void toggleDrawer() {
    if (MediaQuery.of(context).size.width <= 500) {
      setState(() {
        isDrawerOpen = !isDrawerOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        duration: const Duration(milliseconds: 200),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return AdminMobile(
                size: size,
                pageKey: _mobilePageKey,
              );
            } else if (sizingInformation.isTablet) {
              return AdminTab(
                size: size,
                pageKey: _tabPageKey,
              );
            } else {
              return AdminWeb(
                size: size,
                pageKey: _webPageKey,
              );
            }
          },
        ),
      ),
    );
  }
}

class AdminWeb extends StatefulWidget {
  const AdminWeb({
    super.key,
    required Size size,
    required GlobalKey<FormState> pageKey,
  });

  @override
  State<AdminWeb> createState() => _AdminWebState();
}

class _AdminWebState extends State<AdminWeb> {
  bool isDrawerOpen = true;
  void toggleDrawer() {
    if (MediaQuery.of(context).size.width <= 500) {
      setState(() {
        isDrawerOpen = !isDrawerOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);


    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: AppTheme.scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Consumer<AuthProvider>(
            builder: (context, authProvider, _) { return
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [
                  SizedBox(
                      height: 40,
                      child: Image.asset(
                        "assets/images/png/ic_ais_logo.png",
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  const Text(
                    "App In Snap ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isDrawerOpen = !isDrawerOpen;
                      });
                    },
                    child: const Icon(Icons.menu, color: primaryColor, size: 27),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                  ),
                  const Text("Ais Seat Management System",
                      style: TextStyle(
                          fontSize: 24,
                          color: primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
            ),
              );
            },
          ),
          actions: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white),
                    child: const Icon(Icons.person_pin)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Welcome, ${authProvider.userName}!', // Display the user's name
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: const Icon(
                        Icons.logout,
                        color: primaryColor,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider<DashboardProvider>(
        create: (context) =>
            DashboardProvider(),
        child: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, _) {
          return Container(decoration:  BoxDecoration(color: AppTheme.scaffoldBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (size.width > 500 && isDrawerOpen)
                        Expanded(
                          flex: 2,
                          child: CustomAnimatedDrawer(
                            toggleDrawer: () {},
                            dashboardProviderInstance : dashboardProvider,
                          ),
                        ),
                      SizedBox(width: 10,),
                        Expanded(
                        flex: isDrawerOpen ? 7 : 12,
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
                                return _getPageRoute(const AssetsStatistics());
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
                              case Routes.scrapAssets:
                                return _getPageRoute(const ScrapScreen());
                              case Routes.createScrap:
                                return _getPageRoute(const CreateScrapScreen());
                                case Routes.scrapRecovered:
                                return _getPageRoute(const ScrapRecoveredScreen());
                              default:
                                return _getPageRoute(const DashboardPage());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}

class AdminTab extends StatefulWidget {
  const AdminTab({
    super.key,
    required Size size,
    required GlobalKey<FormState> pageKey,
  }) : _tabPageKey = pageKey;

  final GlobalKey<FormState> _tabPageKey;

  @override
  State<AdminTab> createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  List<Widget> page = [
    const DashboardMobile(),
    const UnAssignedAssets(),
    const CreateScrapScreen(),
    const UnAssignedAssets(),
  ];

  int selectedOption = 0;
  ValueNotifier<int> currentPageIndexNotifier = ValueNotifier(0);
  final PageController pageController = PageController(initialPage: 0);

  /// Local Methods
  changePageIndex(int index) {
    setState(() {
      currentPageIndexNotifier.value = index;
    });

    if (index > 1) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        foregroundColor: AppTheme.primaryColor,
        centerTitle: true,
        title: const Text("Ais Seat Management System"),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: Icon(
                Icons.logout,
                color: AppTheme.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentPageIndexNotifier.value = index;
          });
        },
        controller: pageController,
        physics: const ScrollPhysics(),
        children: page,
      ),
      // extendBody: true,

      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentPageIndexNotifier,
          builder: ((context, value, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppTheme.scaffoldBackgroundColor,
              ),
              // height: 62.h,
              // width: double.infinity,
              child: BottomNavigationBar(
                currentIndex: currentPageIndexNotifier.value,
                backgroundColor: Colors.transparent,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.amber,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                iconSize: 10,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  changePageIndex(index);
                },
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.amber,
                      size: 26,
                    ),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      activeIcon: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.amber,
                            size: 26,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: 'Favourite'),
                  const BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.amber,
                        size: 26,
                      ),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: 'Shopping Cart'),
                  const BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.category_outlined,
                        color: Colors.amber,
                        size: 26,
                      ),
                      icon: Icon(
                        Icons.category_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: 'Category'),
                ],
              ),
            );
          })),
    );
  }
}

class AdminMobile extends StatefulWidget {
  const AdminMobile({
    super.key,
    required Size size,
    required GlobalKey<FormState> pageKey,
  });

  @override
  State<AdminMobile> createState() => _AdminMobileState();
}

class _AdminMobileState extends State<AdminMobile> {
  List<Widget> page = [
    const DashboardMobile(),
    const AddAssets(),
    const DeleteAsset(),
    const UnAssignedAssets(),
  ];

  int selectedOption = 0;
  ValueNotifier<int> currentPageIndexNotifier = ValueNotifier(0);
  final PageController pageController = PageController(initialPage: 0);

  /// Local Methods
  changePageIndex(int index) {
    setState(() {
      currentPageIndexNotifier.value = index;
    });

    if (index > 1) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        foregroundColor: AppTheme.primaryColor,
        centerTitle: true,
        title: const Text("Ais Seat Management System"),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: Icon(
                Icons.logout,
                color: AppTheme.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentPageIndexNotifier.value = index;
          });
        },
        controller: pageController,
        physics: const ScrollPhysics(),
        children: page,
      ),
      // extendBody: true,

      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentPageIndexNotifier,
          builder: ((context, value, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppTheme.scaffoldBackgroundColor,
              ),
              // height: 62.h,
              // width: double.infinity,
              child: BottomNavigationBar(
                currentIndex: currentPageIndexNotifier.value,
                backgroundColor: Colors.transparent,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.amber,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                iconSize: 10,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  changePageIndex(index);
                },
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.amber,
                      size: 26,
                    ),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      activeIcon: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.amber,
                            size: 26,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: 'Favourite'),
                  const BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.amber,
                        size: 26,
                      ),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: 'Shopping Cart'),
                  const BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.category_outlined,
                        color: Colors.amber,
                        size: 26,
                      ),
                      icon: Icon(
                        Icons.category_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: 'Category'),
                ],
              ),
            );
          })),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  ValueNotifier<int> currentPageIndexNotifier = ValueNotifier(0);
  final PageController pageController = PageController(initialPage: 0);

   changePageIndex(int index) {
    setState(() {
      currentPageIndexNotifier.value = index;
    });

    if (index > 1) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    }
  }

  int isHovering = 0;

  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Drawer(
      backgroundColor: Colors.grey.shade700,
      elevation: 0,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white10),
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/png/ic_ais_logo.png", width: 300,
                            // color: Colors.white,
                          ),
                        )),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // height: MediaQuery.of(context).size.height * 0.72,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Welcome, ${authProvider.userName}!', // Display the user's name
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 1;
                              });
                              // widget.toggleDrawer();
                              Navigator.pop(context);

                              localNavigator.navigateTo(Routes.dashboard);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 1
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: const Icon(Icons.menu_open)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Dashboard",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 1 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 1
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 3;
                              });
                              Navigator.pop(context);
                              localNavigator
                                  .navigateTo(Routes.assetsStatistics);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 3
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: const Icon(Icons.assessment)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Assets statistics",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 3 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 3
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 4;
                              });
                              Navigator.pop(context);
                              localNavigator.navigateTo(Routes.addAssets);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 4
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child:
                                            const Icon(Icons.add_box_outlined)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Add Assets",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 4 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 4
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 5;
                              });
                              Navigator.pop(context);
                              localNavigator
                                  .navigateTo(Routes.assignAssetsToEmployees);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 5
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: const Icon(Icons.bar_chart)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Assign Assets",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 5 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 5
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 6;
                              });
                              Navigator.pop(context);
                              localNavigator.navigateTo(Routes.unAssignAssets);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 6
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: const Icon(Icons.remove_circle)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Un-Assign Assets",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 6 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 6
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 7;
                              });
                              Navigator.pop(context);
                              localNavigator.navigateTo(Routes.deleteAsset);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 7
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child:
                                            const Icon(Icons.delete_outline)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Delete Asset",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 7 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 7
                                                  ? Colors.black
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 8;
                              });
                              localNavigator.navigateTo(Routes.history);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: selectedOption == 8
                                      ? primaryColor
                                      : Colors.white10,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: const Icon(Icons.history)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "History",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize:
                                                  selectedOption == 8 ? 19 : 17,
                                              fontWeight: FontWeight.bold,
                                              color: selectedOption == 8
                                                  ? Colors.white
                                                  : primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
