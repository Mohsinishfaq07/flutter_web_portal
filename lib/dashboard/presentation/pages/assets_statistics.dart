 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/app_theme.dart';
 import '../../../colors.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/controllers_instances.dart';
import '../widgets/local_navigator.dart';
import '../widgets/routes.dart';
import 'dashboard_page.dart';

class AssetsStatistics extends StatefulWidget {
  const AssetsStatistics({super.key});

  @override
  State<AssetsStatistics> createState() => _AssetsStatisticsState();
}

class _AssetsStatisticsState extends State<AssetsStatistics> {
  int isHovering = 0;
  int selectedOption = 0;
  DashboardProvider? dashboardProvider ;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardProvider!.getAllAssetsCount();
          dashboardProvider!.getAllUnAssignedAssetsCount();
      dashboardProvider!.getFloorOneAssetsCount();
      dashboardProvider!.getFloorTwoAssetsCount();


    });}


 @override
 void dispose() {
    print("asdfghjkl");
   dashboardProvider!.removePage();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    dashboardProvider??= Provider.of<DashboardProvider>(context);



    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),        color: AppTheme.scaffoldBackgroundColor,
      ),      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: 'Asset Statistics', showBackButton: true),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        // height: MediaQuery.of(context).size.height * 0.26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white10,
                            border: Border.all(color: Colors.white10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Consumer<DashboardProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
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
                                         title: 'All Assets Statistics',
                                        quantity: context
                                            .read<DashboardProvider>()
                                            .allAssetsCount,
                                        ontap: () {
                                          setState(() {
                                            selectedOption = 1;
                                          });
                                          localNavigator
                                              .navigateTo(Routes.allAsset);
                                        },
                                        color: selectedOption == 1
                                            ? primaryColor
                                            : Colors.grey.shade600),
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return MouseRegion(
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
                                         title: 'Un-Assigned Assets',
                                        quantity: context
                                            .read<DashboardProvider>()
                                            .allUnAssignedAssetsCount,
                                        ontap: () {
                                          setState(() {
                                            selectedOption = 2;
                                          });
                                          localNavigator.navigateTo(
                                              Routes.unAssignedAssets);
                                        },
                                        color: selectedOption == 2
                                            ? primaryColor
                                            : Colors.grey.shade600),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomHeading(
                  title: 'Floors Asset Statistics', showBackButton: false),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        // height: MediaQuery.of(context).size.height * 0.26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white10,
                            border: Border.all(color: Colors.white10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Consumer<DashboardProvider>(builder:
                                  (BuildContext context, value, Widget? child) {
                                return MouseRegion(
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
                                       title: 'First Floor Assets',
                                      quantity: context
                                          .read<DashboardProvider>()
                                          .firstFloorAssetsCount,
                                      ontap: () {
                                        setState(() {
                                          selectedOption = 3;
                                        });
                                        localNavigator
                                            .navigateTo(Routes.firstFloorAsset);
                                      },
                                      color: selectedOption == 3
                                          ? primaryColor
                                          : Colors.grey.shade600),
                                );
                              }),
                              Consumer<DashboardProvider>(builder:
                                  (BuildContext context, value, Widget? child) {
                                return MouseRegion(
                                  opaque: true,
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
                                       title: 'Second Floor Assets ',
                                      quantity: context
                                          .read<DashboardProvider>()
                                          .secondFloorAssetsCount,
                                      ontap: () {
                                        setState(() {
                                          selectedOption = 4;
                                        });
                                        localNavigator.navigateTo(
                                            Routes.secondFloorAsset);
                                      },
                                      color: selectedOption == 4
                                          ? primaryColor
                                          : Colors.grey.shade600),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
    required this.title,
    this.showBackButton = true,
  });
  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showBackButton)
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: Colors.white,size: 20,)),
          if (showBackButton)
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 22,fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
