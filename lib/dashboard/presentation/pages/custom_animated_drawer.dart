import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/dashboard/presentation/widgets/controllers_instances.dart';
import '../../../colors.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/local_navigator.dart';
import '../widgets/routes.dart';
import 'dashboard_page.dart';

class CustomAnimatedDrawer extends StatefulWidget {
  final VoidCallback toggleDrawer;
  const CustomAnimatedDrawer(
      {super.key,
      required this.toggleDrawer,
      required DashboardProvider dashboardProviderInstance});

  @override
  _CustomAnimatedDrawerState createState() => _CustomAnimatedDrawerState();
}

class _CustomAnimatedDrawerState extends State<CustomAnimatedDrawer>
    with SingleTickerProviderStateMixin {
  DashboardProvider? dashboardProvider;

  // List<int> indexStack = [1];
  //
  // int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    dashboardProvider ??=
        Provider.of<DashboardProvider>(context, listen: false);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width * 10,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/png/ic_ais_logo.png", width: 300,
                    // color: Colors.white,
                  ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<DashboardProvider>(
              builder: (BuildContext context, value, Widget? child) {
            return Padding(
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
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            // scrollDirection: Axis.horizontal,
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(1);

                                localNavigator.navigateTo(Routes.dashboard);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 1
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
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        1
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
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(2);
                                localNavigator
                                    .navigateTo(Routes.assetsStatistics);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 2
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
                                                fontSize: 14,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        2
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
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(3);

                                localNavigator.navigateTo(Routes.addAssets);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 3
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
                                          child: const Icon(
                                              Icons.add_box_outlined)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Add Assets",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        3
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
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(4);

                                localNavigator
                                    .navigateTo(Routes.assignAssetsToEmployees);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 4
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
                                                fontSize: 16,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        4
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
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(5);

                                localNavigator
                                    .navigateTo(Routes.unAssignAssets);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 5
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
                                              const Icon(Icons.remove_circle)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Un-Assign Assets",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 14,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        5
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
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(6);

                                localNavigator.navigateTo(Routes.deleteAsset);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 6
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
                                                fontSize: 16,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        6
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
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(7);

                                localNavigator.navigateTo(Routes.history);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color:
                                        dashboardProvider!.indexStack.last == 7
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
                                                fontSize: 16,
                                                color: dashboardProvider!
                                                            .indexStack.last ==
                                                        7
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
                        ],
                      ),
                    ),
                  )),
            );
          }),
        ],
      ),
    );
  }
}
