import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/app_url.dart';
import '../../../colors.dart';
import '../widgets/routes.dart';

class AssignedEmployees extends StatefulWidget {
  const AssignedEmployees({super.key});

  @override
  State<AssignedEmployees> createState() => _AssignedEmployeesState();
}

class _AssignedEmployeesState extends State<AssignedEmployees> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
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
      color: Colors.grey.shade600,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white10),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white10,
                          // border: Border.all(color: primaryColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            " Assigned Employees  ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.assignAssetsToEmployees);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Assign Assets",
                                  style: TextStyle(
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
                                                                : _size.width >
                                                                        1050
                                                                    ? 10
                                                                    : _size.width >
                                                                            1000
                                                                        ? 9
                                                                        : _size.width >
                                                                                950
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
                                                                                                                            : 6,
                                  )),
                              Icon(
                                Icons.add,
                                size: _size.width > 1400
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
                                                                : _size.width >
                                                                        1000
                                                                    ? 14
                                                                    : _size.width >
                                                                            950
                                                                        ? 14
                                                                        : _size.width >
                                                                                900
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
                                                                                                                        : 6,
                              ),
                            ],
                          ),
                        )),
                  )),
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
                              "Asset Name",
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
                              "Asset Id",
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
                              "Employee Name",
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
