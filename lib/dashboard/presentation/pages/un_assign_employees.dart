import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/app_url.dart';
import 'package:web_portal/dashboard/presentation/pages/assets_statistics.dart';
import '../../../colors.dart';
import '../widgets/routes.dart';

class UnAssignedEmployees extends StatefulWidget {
  const UnAssignedEmployees({super.key});

  @override
  State<UnAssignedEmployees> createState() => _UnAssignedEmployeesState();
}

class _UnAssignedEmployeesState extends State<UnAssignedEmployees> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getUnAssignedEmployees();
  }
  Future<void> getUnAssignedEmployees() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl+AppUrl.unAssignedEmployees;
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['unassignedEmployees'] is List) {
          setState(() {
            assets = List.from(responseData['unassignedEmployees']);
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
CustomHeading(title:" Un-Assigned Employees Statistics",showBackButton: true),              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.assignAssetsToEmployees);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text("Assign Assets" ,style: TextStyle(
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
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade500),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DataTable(
                            columnSpacing: MediaQuery.of(context).size.width * 0.10,
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
                                label: Row(
                                  children: [
                                    Text(
                                      "Employee Id",
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
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryColor),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Email",
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
                                  ),DataCell(
                                    Text(
                                      asset['Employee_id']?.toString() ?? 'N/A',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DataCell(
                                      Text(
                                        asset['name']?.toString() ?? 'N/A',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      showEditIcon: true),
                                  DataCell(
                                    Text(
                                      asset['email']?.toString() ?? 'N/A',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),

                                ],
                              );
                            },).toList(),
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
