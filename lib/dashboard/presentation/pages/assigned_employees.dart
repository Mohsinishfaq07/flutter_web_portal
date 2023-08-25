import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/app_url.dart';
import 'package:web_portal/continue_button.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../colors.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

class AssignedEmployees extends StatefulWidget {
  const AssignedEmployees({super.key});

  @override
  State<AssignedEmployees> createState() => _AssignedEmployeesState();
}

class _AssignedEmployeesState extends State<AssignedEmployees> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getAssignedEmployees();
  }

  Future<void> getAssignedEmployees() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl + AppUrl.assignedEmployees;
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var responseData = response.data;
        if (responseData['modifiedResult'] is List) {
          setState(() {
            assets = List.from(responseData['modifiedResult']);
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                      backgroundColor: Colors.blue,
                    ))
                  : const CustomHeading(
                      title: 'Assigned Employees', showBackButton: true),
              const SizedBox(height: 20),
              OrangeButton(
                  size: _size,
                  title: "Assign Asset",
                  ontap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.assignAssetsToEmployees);
                  }),
              const SizedBox(height: 10),
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade500),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    // columnSpacing: MediaQuery.of(context).size.width * 0.03,
                    columns: [
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Serial Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Asset Name ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Employee Role",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Asset Type",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Asset id ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Role",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Employee Id",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade600,
                              border: Border.all(color: Colors.white24)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
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
                                asset['asset_name']?.toString() ?? 'N/A',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                              Text(
                                asset['role']?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                                Text(
                                  asset['asset_type']?.toString() ?? 'N/A',
                                  style: TextStyle(color: Colors.white),
                                ),
                                showEditIcon: true),
                            DataCell(
                              Text(
                                asset['assetIDs']?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                              Text(
                                asset["name"]?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                              Text(
                                asset['Employee_iD']?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                              Text(
                                asset['location_id']?.toString() ?? 'N/A',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
