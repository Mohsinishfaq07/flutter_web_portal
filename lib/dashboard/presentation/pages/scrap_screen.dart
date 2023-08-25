import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';

import '../../../app_theme.dart';
import '../../../app_url.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

class ScrapScreen extends StatefulWidget {
  const ScrapScreen({super.key});

  @override
  State<ScrapScreen> createState() => _ScrapScreenState();
}

class _ScrapScreenState extends State<ScrapScreen> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getScrapAssets();
  }

  Future<void> getScrapAssets() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl + AppUrl.scrap;
      // var url = 'http://192.168.4.139:3000/asset/location/Ais-F1';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['scrap_assets'] is List) {
          setState(() {
            assets = List.from(responseData['scrap_assets']);
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
    Size size = MediaQuery.of(context).size;

    return Container(
      color:  AppTheme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: 'Scrap Assets Statistics',
                  showBackButton: true),
              OrangeButton(size: size, title: "Add Asset", ontap: () {

                Navigator.pushReplacementNamed(
                    context, Routes.addAssets);
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
                              "Serial Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
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
              // Container(
              //   child: isLoading
              //       ? const Center(child: CircularProgressIndicator())
              //       : assets.isNotEmpty
              //           ? ListView.builder(
              //               shrinkWrap: true,
              //               itemCount: assets.length,
              //               itemBuilder: (context, index) {
              //                 final asset = assets[index];
              //                 return Column(
              //                   children: [
              //                     Text(
              //                         asset['asset_name']?.toString() ?? 'N/A'),
              //                     Text(
              //                         asset['location_id']?.toString() ?? 'N/A'),
              //                     ListTile(
              //                       title: Text(
              //                           asset['asset_name']?.toString() ?? 'N/A'),
              //                       subtitle: Text(
              //                           asset['location_id']?.toString() ?? 'N/A'),
              //                       // Customize the UI as needed for each asset
              //                     ),
              //                   ],
              //                 );
              //               },
              //             )
              //           : Center(
              //               child: Container(
              //                   height: MediaQuery.of(context).size.height,
              //                   width: MediaQuery.of(context).size.width,
              //                   decoration: BoxDecoration(
              //                       color: Colors.grey.shade100,
              //                       borderRadius: BorderRadius.circular(12)),
              //                   child: const Center(
              //                       child: Text('No data available'))),
              //             ),
              // )
            ],
          ),
        ),
      ),
    );;
  }
}
