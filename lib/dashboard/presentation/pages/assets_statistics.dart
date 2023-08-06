import 'package:flutter/material.dart';
import '../../../colors.dart';
import '../widgets/controllers_instances.dart';
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
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      color: Colors
          .grey.shade600, // color: const Color(0xFF23BCBA).withOpacity(0.09),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: 'Asset Statistics', showBackButton: true),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white10,
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MouseRegion(
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
                                selectedOption=0;
                              });
                              localNavigator.navigateTo(Routes.allAsset);
                            },
                            child: Container(
                                height: _size.width > 1000
                                    ? 150
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
                                width: _size.width > 1450
                                    ? 380
                                    : _size.width > 1400
                                        ? 300
                                        : _size.width > 1350
                                            ? 280
                                            : _size.width > 1300
                                                ? 270
                                                : _size.width > 1250
                                                    ? 260
                                                    : _size.width > 1200
                                                        ? 250
                                                        : _size.width > 1150
                                                            ? 240
                                                            : _size.width > 1100
                                                                ? 230
                                                                : _size.width > 1050
                                                                    ? 220
                                                                    : _size.width >
                                                                            1000
                                                                        ? 210
                                                                        : _size.width >
                                                                                950
                                                                            ? 200
                                                                            : _size.width >
                                                                                    900
                                                                                ? 190
                                                                                : _size.width > 850
                                                                                    ? 180
                                                                                    : _size.width > 800
                                                                                        ? 170
                                                                                        : _size.width > 750
                                                                                            ? 160
                                                                                            : _size.width > 700
                                                                                                ? 150
                                                                                                : _size.width > 650
                                                                                                    ? 140
                                                                                                    : _size.width > 600
                                                                                                        ? 130
                                                                                                        : _size.width > 550
                                                                                                            ? 115
                                                                                                            : _size.width > 500
                                                                                                                ? 105
                                                                                                                : _size.width > 450
                                                                                                                    ? 100
                                                                                                                    : _size.width > 300
                                                                                                                        ? 90
                                                                                                                        : 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: primaryColor), color: selectedOption == 1? primaryColor : Colors.grey.shade600),
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text("All Assets",
                                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                                                                        : _size.width > 850
                                                                                            ? 16
                                                                                            : _size.width > 800
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
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            localNavigator.navigateTo(Routes.unAssignedAssets);
                          },
                          child: Container(
                              height: _size.width > 1000
                                  ? 150
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
                              width: _size.width > 1450
                                  ? 380
                                  : _size.width > 1400
                                      ? 300
                                      : _size.width > 1350
                                          ? 280
                                          : _size.width > 1300
                                              ? 270
                                              : _size.width > 1250
                                                  ? 260
                                                  : _size.width > 1200
                                                      ? 250
                                                      : _size.width > 1150
                                                          ? 240
                                                          : _size.width > 1100
                                                              ? 230
                                                              : _size.width > 1050
                                                                  ? 220
                                                                  : _size.width >
                                                                          1000
                                                                      ? 210
                                                                      : _size.width >
                                                                              950
                                                                          ? 200
                                                                          : _size.width >
                                                                                  900
                                                                              ? 190
                                                                              : _size.width > 850
                                                                                  ? 180
                                                                                  : _size.width > 800
                                                                                      ? 170
                                                                                      : _size.width > 750
                                                                                          ? 160
                                                                                          : _size.width > 700
                                                                                              ? 150
                                                                                              : _size.width > 650
                                                                                                  ? 140
                                                                                                  : _size.width > 600
                                                                                                      ? 130
                                                                                                      : _size.width > 550
                                                                                                          ? 115
                                                                                                          : _size.width > 500
                                                                                                              ? 105
                                                                                                              : _size.width > 450
                                                                                                                  ? 100
                                                                                                                  : _size.width > 300
                                                                                                                      ? 90
                                                                                                                      : 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: primaryColor), color: Colors.grey.shade600),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Text("Un Assigned assets ",
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                                                                      : _size.width > 850
                                                                                          ? 16
                                                                                          : _size.width > 800
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
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomHeading(
                  title: 'Floors Asset Statistics', showBackButton: false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white10,
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            localNavigator.navigateTo(Routes.firstFloorAsset);
                          },
                          child: Container(
                              height: _size.width > 1000
                                  ? 150
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
                              width: _size.width > 1450
                                  ? 380
                                  : _size.width > 1400
                                      ? 300
                                      : _size.width > 1350
                                          ? 280
                                          : _size.width > 1300
                                              ? 270
                                              : _size.width > 1250
                                                  ? 260
                                                  : _size.width > 1200
                                                      ? 250
                                                      : _size.width > 1150
                                                          ? 240
                                                          : _size.width > 1100
                                                              ? 230
                                                              : _size.width > 1050
                                                                  ? 220
                                                                  : _size.width >
                                                                          1000
                                                                      ? 210
                                                                      : _size.width >
                                                                              950
                                                                          ? 200
                                                                          : _size.width >
                                                                                  900
                                                                              ? 190
                                                                              : _size.width > 850
                                                                                  ? 180
                                                                                  : _size.width > 800
                                                                                      ? 170
                                                                                      : _size.width > 750
                                                                                          ? 160
                                                                                          : _size.width > 700
                                                                                              ? 150
                                                                                              : _size.width > 650
                                                                                                  ? 140
                                                                                                  : _size.width > 600
                                                                                                      ? 130
                                                                                                      : _size.width > 550
                                                                                                          ? 115
                                                                                                          : _size.width > 500
                                                                                                              ? 105
                                                                                                              : _size.width > 450
                                                                                                                  ? 100
                                                                                                                  : _size.width > 300
                                                                                                                      ? 90
                                                                                                                      : 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: primaryColor), color: Colors.grey.shade600),
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Text("First Floor",
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                                                                      : _size.width > 850
                                                                                          ? 16
                                                                                          : _size.width > 800
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
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            localNavigator.navigateTo(Routes.secondFloorAsset);
                          },
                          child: Container(
                              height: _size.width > 1000
                                  ? 150
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
                              width: _size.width > 1450
                                  ? 380
                                  : _size.width > 1400
                                      ? 300
                                      : _size.width > 1350
                                          ? 280
                                          : _size.width > 1300
                                              ? 270
                                              : _size.width > 1250
                                                  ? 260
                                                  : _size.width > 1200
                                                      ? 250
                                                      : _size.width > 1150
                                                          ? 240
                                                          : _size.width > 1100
                                                              ? 230
                                                              : _size.width > 1050
                                                                  ? 220
                                                                  : _size.width >
                                                                          1000
                                                                      ? 210
                                                                      : _size.width >
                                                                              950
                                                                          ? 200
                                                                          : _size.width >
                                                                                  900
                                                                              ? 190
                                                                              : _size.width > 850
                                                                                  ? 180
                                                                                  : _size.width > 800
                                                                                      ? 170
                                                                                      : _size.width > 750
                                                                                          ? 160
                                                                                          : _size.width > 700
                                                                                              ? 150
                                                                                              : _size.width > 650
                                                                                                  ? 140
                                                                                                  : _size.width > 600
                                                                                                      ? 130
                                                                                                      : _size.width > 550
                                                                                                          ? 115
                                                                                                          : _size.width > 500
                                                                                                              ? 105
                                                                                                              : _size.width > 450
                                                                                                                  ? 100
                                                                                                                  : _size.width > 300
                                                                                                                      ? 90
                                                                                                                      : 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: primaryColor), color: Colors.grey.shade600),
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Text("Second Floor ",
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                                                                      : _size.width > 850
                                                                                          ? 16
                                                                                          : _size.width > 800
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
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                        ),
                      ],
                    ),
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
    return Row(
      children: [
        if (showBackButton)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.arrow_back, color: primaryColor),
                  )),
            ),
          ),
        if (showBackButton)
          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white10,
              // border: Border.all(color: primaryColor)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
