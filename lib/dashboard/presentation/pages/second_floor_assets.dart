import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';

import '../../../app_url.dart';

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
      var url = AppUrl.baseUrl + AppUrl.secondFloorAsset;
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),        color: AppTheme.scaffoldBackgroundColor,
      ),      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: 'Second Floor Assets Statistics',
                  showBackButton: true),
              OrangeButton(
                  size: _size,
                  title: "Add Asset",
                  ontap: () {
                    Navigator.pushReplacementNamed(context, Routes.addAssets);
                  }),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,

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
                    rows: assets.map(
                      (asset) {
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
                              Text(
                                asset["type_name"]?.toString() ?? 'N/A',
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
                      },
                    ).toList(),
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
