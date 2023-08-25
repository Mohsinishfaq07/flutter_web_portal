import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/app_url.dart';
import 'package:web_portal/dashboard/presentation/pages/assets_statistics.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../continue_button.dart';
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
      var url = AppUrl.baseUrl + AppUrl.unAssignedEmployees;
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: " Un-Assigned Employees ", showBackButton: true),
              OrangeButton(
                  size: _size,
                  title: "Assign Asset",
                  ontap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.unAssignedEmployees);
                  }),
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
                            columnSpacing:
                                MediaQuery.of(context).size.width * 0.10,
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
                                        asset['Employee_id']?.toString() ??
                                            'N/A',
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
                              },
                            ).toList(),
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
