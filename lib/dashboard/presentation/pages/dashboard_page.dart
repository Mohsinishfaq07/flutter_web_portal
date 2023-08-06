import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../app_url.dart';
import '../../../colors.dart';
import '../widgets/controllers_instances.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int isHovering = 0;
  int selectedOption = 0;
  @override
  void initState() {
    super.initState();
    final dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.getAssignedUserCount();
    dashboardProvider.getAUnssignedUserCount();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade600,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomHeading(title: 'Dashboard', showBackButton: false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white10,
                      border: Border.all(color: Colors.white10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Consumer<DashboardProvider>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return MouseRegion(
                                opaque: true,
                                onEnter: (event) {
                                  setState(() {
                                    isHovering = 1;
                                    selectedOption = 1;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    isHovering = 0;
                                    selectedOption = 0;
                                  });
                                },
                                child: CustomDashboardContainer(
                                  size: _size,
                                  title: 'Assigned Employees',
                                  quantity: context
                                      .read<DashboardProvider>()
                                      .assignedUserCount,
                                  ontap: () {
                                    setState(() {
                                      selectedOption = 1;
                                    });

                                    localNavigator
                                        .navigateTo(Routes.assignedEmployees);
                                  },
                                  color: selectedOption == 1
                                      ? primaryColor
                                      : Colors.grey.shade600,
                                ),
                              );
                            },
                          ),
                          MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 2;
                                selectedOption = 2;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              size: _size,
                              title: 'Un-Assigned Employees',
                              quantity: context
                                  .watch<DashboardProvider>()
                                  .unAssignedUserCount,
                              ontap: () {
                                selectedOption = 2;

                                localNavigator
                                    .navigateTo(Routes.unAssignedEmployees);
                              },
                              color: selectedOption == 2
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          ),
                          MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 3;
                                selectedOption = 3;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              size: _size,
                              title: 'Assign Assets ',
                              iconData: Icons.add,
                              ontap: () {
                                setState(() {
                                  selectedOption = 3;
                                });
                                localNavigator
                                    .navigateTo(Routes.assignAssetsToEmployees);
                              },
                              color: selectedOption == 3
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          ),
                          MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 5;
                                selectedOption = 5;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              size: _size,
                              title: 'Un-Assign Assets ',
                              iconData: Icons.delete,
                              ontap: () {
                                setState(() {
                                  selectedOption = 5;
                                });
                                localNavigator
                                    .navigateTo(Routes.unAssignAssets);
                              },
                              color: selectedOption == 5
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const CustomHeading(
                  title: 'Asset Statistics', showBackButton: false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white10,
                      border: Border.all(color: Colors.white10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 6;
                                selectedOption = 6;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                                size: _size,
                                title: 'Assets Statistics',
                                ontap: () {
                                  setState(() {
                                    selectedOption = 6;
                                  });
                                  localNavigator
                                      .navigateTo(Routes.assetsStatistics);
                                },
                                color: selectedOption == 6
                                    ? primaryColor
                                    : Colors.grey.shade600),
                          ),
                          MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 7;
                                selectedOption = 7;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                                size: _size,
                                title: 'Add Assets ',
                                iconData: Icons.add,
                                ontap: () {
                                  setState(() {
                                    selectedOption = 7;
                                  });
                                  localNavigator.navigateTo(Routes.addAssets);
                                },
                                color: selectedOption == 7
                                    ? primaryColor
                                    : Colors.grey.shade600),
                          ),
                          MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                isHovering = 4;
                                selectedOption = 4;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              size: _size,
                              title: 'Delete Assets ',
                              iconData: Icons.delete,
                              ontap: () {
                                setState(() {
                                  selectedOption = 4;
                                });
                                localNavigator.navigateTo(Routes.deleteAsset);
                              },
                              color: selectedOption == 4
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDashboardContainer extends StatelessWidget {
  const CustomDashboardContainer({
    super.key,
    required Size size,
    required this.title,
    required this.ontap,
    required this.color,
    this.quantity,
    this.iconData,
  }) : _size = size;

  final Size _size;
  final Color color;
  final int? quantity;
  final String title;
  final IconData? iconData;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: _size.width > 1000
            ? 160
            : _size.width > 900
                ? 145
                : _size.width > 850
                    ? 140
                    : _size.width > 800
                        ? 135
                        : _size.width > 750
                            ? 130
                            : _size.width > 700
                                ? 125
                                : _size.width > 650
                                    ? 120
                                    : 100,
        // width: _size.width > 1480
        //     ? 380
        //     : _size.width > 1460
        //         ? 260
        //         : _size.width > 1440
        //             ? 250
        //             : _size.width > 1420
        //                 ? 380
        //                 : _size.width > 1400
        //                     ? 230
        //                     : _size.width > 1350
        //                         ? 220
        //                         : _size.width > 1300
        //                             ? 210
        //                             : _size.width > 1250
        //                                 ? 200
        //                                 : _size.width > 1200
        //                                     ? 190
        //                                     : _size.width > 1150
        //                                         ? 180
        //                                         : _size.width > 1100
        //                                             ? 170
        //                                             : _size.width > 1050
        //                                                 ? 160
        //                                                 : _size.width > 1000
        //                                                     ? 150
        //                                                     : _size.width > 950
        //                                                         ? 140
        //                                                         : _size.width > 900
        //                                                             ? 130
        //                                                             : _size.width > 850
        //                                                                 ? 120
        //                                                                 : _size.width > 800
        //                                                                     ? 110
        //                                                                     : _size.width > 750
        //                                                                         ? 100
        //                                                                         : _size.width > 700
        //                                                                             ? 90
        //                                                                             : _size.width > 650
        //                                                                                 ? 70
        //                                                                                 : _size.width > 600
        //                                                                                     ? 70
        //                                                                                     : _size.width > 550
        //                                                                                         ? 80
        //                                                                                         : _size.width > 500
        //                                                                                             ? 80
        //                                                                                             : _size.width > 450
        //                                                                                                 ? 80
        //                                                                                                 : _size.width > 300
        //                                                                                                     ? 80
        //                                                                                                     : 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor),
            color: color),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  // "Assets Statistics",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: _size.width > 1400
                          ? 26
                          : _size.width > 1350
                              ? 25
                              : _size.width > 1300
                                  ? 24
                                  : _size.width > 1250
                                      ? 23
                                      : _size.width > 1200
                                          ? 22
                                          : _size.width > 1150
                                              ? 21
                                              : _size.width > 1100
                                                  ? 20
                                                  : _size.width > 1050
                                                      ? 19
                                                      : _size.width > 1000
                                                          ? 18
                                                          : _size.width > 950
                                                              ? 17
                                                              : _size.width >
                                                                      900
                                                                  ? 16
                                                                  : _size.width >
                                                                          850
                                                                      ? 15
                                                                      : _size.width >
                                                                              800
                                                                          ? 14
                                                                          : _size.width > 750
                                                                              ? 13
                                                                              : _size.width > 700
                                                                                  ? 12
                                                                                  : _size.width > 650
                                                                                      ? 11
                                                                                      : _size.width > 600
                                                                                          ? 10
                                                                                          : _size.width > 550
                                                                                              ? 9
                                                                                              : _size.width > 500
                                                                                                  ? 8
                                                                                                  : _size.width > 450
                                                                                                      ? 7
                                                                                                      : _size.width > 400
                                                                                                          ? 6
                                                                                                          : _size.width > 350
                                                                                                              ? 7
                                                                                                              : 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              if (quantity != null)
                Text(quantity?.toString() ?? '',
                    // "01 ",
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
                                                              : _size.width >
                                                                      900
                                                                  ? 17
                                                                  : _size.width >
                                                                          850
                                                                      ? 16
                                                                      : _size.width >
                                                                              800
                                                                          ? 15
                                                                          : _size.width > 750
                                                                              ? 14
                                                                              : _size.width > 700
                                                                                  ? 13
                                                                                  : _size.width > 650
                                                                                      ? 12
                                                                                      : _size.width > 600
                                                                                          ? 11
                                                                                          : _size.width > 550
                                                                                              ? 10
                                                                                              : _size.width > 500
                                                                                                  ? 9
                                                                                                  : _size.width > 450
                                                                                                      ? 8
                                                                                                      : _size.width > 400
                                                                                                          ? 7
                                                                                                          : _size.width > 350
                                                                                                              ? 6
                                                                                                              : 5,
                      color: Colors.grey.shade800,
                    )),
              if (quantity == null)
                Icon(
                  iconData, // Customize the icon as needed
                  size: _size.width > 900
                      ? 52
                      : _size.width > 800
                          ? 50
                          : _size.width > 750
                              ? 48
                              : _size.width > 700
                                  ? 46
                                  : _size.width > 650
                                      ? 44
                                      : _size.width > 600
                                          ? 42
                                          : _size.width > 550
                                              ? 40
                                              : _size.width > 500
                                                  ? 38
                                                  : _size.width > 450
                                                      ? 36
                                                      : _size.width > 400
                                                          ? 34
                                                          : _size.width > 350
                                                              ? 32
                                                              : _size.width >
                                                                      300
                                                                  ? 30
                                                                  : 30, // Customize the size as needed
                  color: Colors.grey.shade800,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardProvider extends ChangeNotifier {
  int? assignedUserCount;
  int? unAssignedUserCount;

  int isHovering = 0;
  int selectedOption = 0;
  bool isLoading = false;
  Future<void> getAssignedUserCount() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl + AppUrl.assignedUserCount;
      // var url = 'http://192.168.4.139:3000/asset/allAssets';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['total_assigned_users'] != null) {
          assignedUserCount = responseData['total_assigned_users'];
          isLoading = false;
        } else {
          isLoading = false;
        }
      } else {
        print('API request failed with status: ${response.statusCode}');
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> getAUnssignedUserCount() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl + AppUrl.unAssignedUserCount;
      // var url = 'http://192.168.4.139:3000/asset/allAssets';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['total_unassigned_users'] != null) {
          unAssignedUserCount = responseData['total_unassigned_users'];
          isLoading = false;
        } else {
          isLoading = false;
        }
      } else {
        print('API request failed with status: ${response.statusCode}');
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
