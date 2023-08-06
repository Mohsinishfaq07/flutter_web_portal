import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_portal/app_theme.dart';

import '../../../app_url.dart';
import '../../../colors.dart';
import '../widgets/admin_section_heading.dart';
import '../widgets/department_controller.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

class SecondFlorAsset extends StatefulWidget {
  const SecondFlorAsset({super.key});

  @override
  State<SecondFlorAsset> createState() => _SecondFlorAssetState();
}

class _SecondFlorAssetState extends State<SecondFlorAsset> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getSecondFloorAssets();
  }
  Future<void> getSecondFloorAssets() async {
    try {
      Dio dio = Dio();
      var url =AppUrl.baseUrl+AppUrl.secondFloorAsset;
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['locations'] is List) {
          setState(() {
            assets = List.from(responseData['locations']);
            isLoading = false;
          });
        } else {
          setState(() {
            assets = [];
            isLoading = false;
          });
        }
      } else {
        print('API request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey.shade600,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeading(title: 'Second Floor Assets Statistics',showBackButton: true),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.addAssets);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text("Add Assets" ,style: TextStyle(
                                fontSize: _size.width > 1400
                                    ? 18
                                    : _size.width > 1350
                                    ? 16
                                    : _size.width > 1300
                                    ? 15
                                    : _size.width > 1250
                                    ? 14
                                    : _size.width > 1200
                                    ? 13
                                    : _size.width > 1150
                                    ? 12
                                    : _size.width > 1100
                                    ? 11
                                    : _size.width > 1050
                                    ? 10
                                    : _size.width > 1000
                                    ? 9
                                    : _size.width > 950
                                    ? 8
                                    : _size.width > 900
                                    ? 7
                                    : _size.width > 850
                                    ? 6
                                    : _size.width > 800
                                    ? 6
                                    : _size.width > 750
                                    ? 6
                                    : _size.width > 700
                                    ? 6
                                    : _size.width > 650
                                    ? 6
                                    : _size.width > 600
                                    ? 6
                                    : _size.width > 550
                                    ? 6
                                    : _size.width > 500
                                    ? 6
                                    : _size.width > 450
                                    ? 6
                                    : _size.width > 400
                                    ? 6
                                    : _size.width > 350
                                    ? 6
                                    : 6 ,

                              )),
                              Icon(Icons.add,size:  _size.width > 1400
                                  ? 17
                                  : _size.width > 1350
                                  ? 16
                                  : _size.width > 1300
                                  ? 15
                                  : _size.width > 1250
                                  ? 14
                                  : _size.width > 1200
                                  ? 14
                                  : _size.width > 1150
                                  ? 14
                                  : _size.width > 1100
                                  ? 14
                                  : _size.width > 1050
                                  ? 14
                                  : _size.width > 1000
                                  ? 14
                                  : _size.width > 950
                                  ? 14
                                  : _size.width > 900
                                  ? 14
                                  : _size.width > 850
                                  ? 14
                                  : _size.width > 800
                                  ? 14
                                  : _size.width > 750
                                  ? 14
                                  : _size.width > 700
                                  ? 14
                                  : _size.width > 650
                                  ? 14
                                  : _size.width > 600
                                  ? 14
                                  : _size.width > 550
                                  ? 6
                                  : _size.width > 500
                                  ? 6
                                  : _size.width > 450
                                  ? 6
                                  : _size.width > 400
                                  ? 6
                                  : _size.width > 350
                                  ? 6
                                  : 6 ,),
                            ],
                          ),
                        )),
                  )),
              SizedBox(height: 10,)
,
              Container(
                // height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade500),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: MediaQuery.of(context).size.width * 0.11,
                    columns: [
                      DataColumn(
                        label: Row(
                          children: [
                            Text(
                              "Serial number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                            const Icon(Icons.architecture),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Asset Id",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Asset Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Row(
                          children: [
                            Text(
                              "Asset Type",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                            const Icon(Icons.architecture),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor),
                        ),
                      ),

                    ],
                    rows: assets.map((asset){
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              asset['serial_no']?.toString() ?? 'N/A',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataCell(
                              Text(
                                asset['asset_id']?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                              showEditIcon: true),
                          DataCell(
                            Text(
                              asset['asset_name']?.toString() ?? 'N/A',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataCell(
                            Text(asset["type_name"]?.toString() ?? 'N/A',
                              style: TextStyle(color: Colors.white),
                            ),

                          ),
                          DataCell(
                            Text(
                              asset['floor_location']?.toString() ?? 'N/A',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                        ],
                      );
                    },).toList(),
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
