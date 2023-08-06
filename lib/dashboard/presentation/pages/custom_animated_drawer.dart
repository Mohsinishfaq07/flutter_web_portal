import 'package:flutter/material.dart';
import '../../../colors.dart';
import '../widgets/controllers_instances.dart';
import '../widgets/routes.dart';

class CustomAnimatedDrawer extends StatefulWidget {
  final VoidCallback toggleDrawer;
  const CustomAnimatedDrawer({super.key, required this.toggleDrawer});

  @override
  _CustomAnimatedDrawerState createState() => _CustomAnimatedDrawerState();
}

class _CustomAnimatedDrawerState extends State<CustomAnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late Size _screen;

  int isHovering = 0;
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width * 20,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        color: Colors.grey.shade500, // color: const Color(0xFF23BCBA).withOpacity(0.09),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10
                ),
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/png/ic_ais_logo.png",width: 300,
                    // color: Colors.white,
                  ),
                )),
          ),
          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // height: MediaQuery.of(context).size.height * 0.72,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    color: Colors.grey.shade600,
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
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
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
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 1;
                                });
                                widget.toggleDrawer();

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
                                                    ? Colors.black
                                                    : primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
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
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 2;
                                });
                                localNavigator
                                    .navigateTo(Routes.assetsStatistics);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: selectedOption == 2
                                        ? primaryColor
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white),
                                          child: Icon(Icons.assessment)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Assets statistics",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize:
                                                    selectedOption == 2 ? 19 : 17,
                                                fontWeight: FontWeight.bold,
                                                color: selectedOption == 2
                                                    ? Colors.white
                                                    : primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
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
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 3;
                                });
                                localNavigator.navigateTo(Routes.addAssets);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isHovering == 3
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
                                          child: const Icon(Icons.ac_unit)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Add assets",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize:
                                                    selectedOption == 3 ? 19 : 17,
                                                fontWeight: FontWeight.bold,
                                                color: selectedOption == 3
                                                    ? Colors.black
                                                    : primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
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
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 6;
                                });
                                localNavigator
                                    .navigateTo(Routes.assignAssetsToEmployees);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isHovering == 6
                                        ? primaryColor
                                        : Colors.white10,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white),
                                          child: const Icon(Icons.add)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Assign assets to employees",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize:
                                                    selectedOption == 6 ? 19 : 17,
                                                fontWeight: FontWeight.bold,
                                                color: selectedOption == 6
                                                    ? Colors.black
                                                    : primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
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
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 7;
                                });
                                localNavigator.navigateTo(Routes.unAssignAssets);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isHovering == 7
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
                                          child: const Icon(Icons.remove)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Un-Assign Asset",
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                isHovering = 8;
                                selectedOption = 8;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 8;
                                });
                                localNavigator.navigateTo(Routes.deleteAsset);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isHovering == 8
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
                                          child: const Icon(Icons.delete_outline)),
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
                                            selectedOption == 8 ? 19 : 17,
                                            fontWeight: FontWeight.bold,
                                            color: selectedOption == 8
                                                ? Colors.black
                                                : primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                isHovering = 9;
                                selectedOption = 9;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = 9;
                                });
                                localNavigator.navigateTo(Routes.history);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isHovering == 9
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
                                            selectedOption == 9 ? 19 : 17,
                                            fontWeight: FontWeight.bold,
                                            color: selectedOption == 9
                                                ? Colors.black
                                                : primaryColor),
                                      ),
                                    ],
                                  ),
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
          ),
        ],
      ),
    );
  }
}
