// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../colors.dart';
// import '../widgets/admin_section_heading.dart';
// import '../widgets/department_controller.dart';
// import 'package:http/http.dart' as http;
//
// import '../widgets/routes.dart';
//
// class FirstFlorAsset extends StatefulWidget {
//
//   @override
//   State<FirstFlorAsset> createState() => _FirstFlorAssetState();
// }
//
// class _FirstFlorAssetState extends State<FirstFlorAsset> {
//   Map<String, dynamic>? responseData;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchAssetData();
//   }
//   Future fetchAssetData() async {
//     try {
//       Dio dio = Dio();
//
//       var url = 'http://192.168.4.120:3000/asset/location/Ais-F1';
//       var response = await dio.get(url);
//
//       if (response.statusCode == 200) {
//         print(response.statusCode);
//         // chairCount = response.data['location_id'] as int? ?? 0;
//         // mobileCount = response.data['mobile_count'] as int? ?? 0;
//         // laptopCount = response.data['laptop_count'] as int? ?? 0;
//         // internetDeviceCount = response.data['internet_device_count'] as int? ?? 0;
//         // Navigator.pushReplacementNamed(context, Routes.dashboard);
//
//         setState(() {
//           responseData = response.data;
//           isLoading = false;
//         });
//
//         print( response.data  );
//         // Map<String, dynamic> data = json.decode(response.);
//         // setState(() {
//         //   chairCount = data['chair_count'] as int? ?? 0;
//         //   mobileCount = data['mobile_count'] as int? ?? 0;
//         //   laptopCount = data['laptop_count'] as int? ?? 0;
//         //   internetDeviceCount = data['internet_device_count'] as int? ?? 0;
//         // });
//       } else {
//         print('API request failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
//
//   // Future<void> fetchAssetData() async {
//   //   var url = 'http://192.168.4.120:3000/asset/location/Ais-F1';
//   //   // final apiUrl = 'http://192.168.4.120:3000/asset/location/Ais-F1';
//   //
//   //   try {
//   //     Dio dio = Dio();
//   //
//   //     final response = await http.get(Uri.parse(url));
//   //
//   //     if (response.statusCode == 200) {
//   //       Map<String, dynamic> data = json.decode(response.body);
//   //       setState(() {
//   //         chairCount = data['chair_count'] as int? ?? 0;
//   //         mobileCount = data['mobile_count'] as int? ?? 0;
//   //         laptopCount = data['laptop_count'] as int? ?? 0;
//   //         internetDeviceCount = data['internet_device_count'] as int? ?? 0;
//   //       });
//   //     } else {
//   //       print('Request failed with status: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching data: $e');
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       color: const Color(0xFF23BCBA).withOpacity(0.09),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//                 child: Text(
//                   "First Floor Assets statistics ",
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleLarge!
//                       .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text("Asset name"),
//                   Text("Asset name"),
//                 ],
//               ),Row(
//                 children: [
//                   Text("Location id"),
//                   Text("Asset name"),
//                 ],
//               ),Row(
//                 children: [
//                   Text("city"),
//                   Text("Asset name"),
//                 ],
//               ),Row(
//                 children: [
//                   Text("Asset type Name"),
//                   Text("Asset name"),
//                 ],
//               ),
//               //
//               // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: [
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             isLoading ? CircularProgressIndicator()
//               //                       :  responseData != null ? Text(responseData.toString())  : Text('No data available'),
//               //
//               //             Text("Chair ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Mobile ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Laptop ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Internet device ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //   ],
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               //   child: Text(
//               //     "Assigned Assets statistics ",
//               //     style: Theme.of(context)
//               //         .textTheme
//               //         .titleLarge!
//               //         .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
//               //   ),
//               // ),
//               //
//               // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: [
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Chair ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Mobile ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Laptop ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Internet device ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //   ],
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               //   child: Text(
//               //     "Unassigned Assets statistics ",
//               //     style: Theme.of(context)
//               //         .textTheme
//               //         .titleLarge!
//               //         .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
//               //   ),
//               // ),
//               //
//               // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: [
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Chair ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Mobile ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //     Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Laptop ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),Container(
//               //         height: MediaQuery.of(context).size.height * 0.2,
//               //         width:  MediaQuery.of(context).size.width * 0.16,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(12),
//               //             border: Border.all(color: Colors.white),
//               //             color: Colors.deepPurple.shade50),
//               //         margin: const EdgeInsets.symmetric(horizontal: 15),
//               //         padding: const EdgeInsets.symmetric(
//               //           vertical: 20,
//               //         ),
//               //         child: Column(
//               //           children: [
//               //             Text("Internet device ",
//               //                 style: Theme.of(context)
//               //                     .textTheme
//               //                     .titleLarge!
//               //                     .copyWith(
//               //                     fontSize: 20, fontWeight: FontWeight.bold)),
//               //             const SizedBox(
//               //               height: 10,
//               //             ),
//               //             Text("01 ",
//               //                 style: const TextStyle(
//               //                     fontSize: 40,
//               //                     color: primaryColor,
//               //                     fontWeight: FontWeight.bold)),
//               //           ],
//               //         )),
//               //   ],
//               // ),
//
//               //? NAVBAR  IS HERE
//
//               // Container(
//               //   height: 60,
//               //   color: klightbg,
//               //   child: const Row(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     //TODO ADD DEPT DROPDOWN HERE
//               //     // children: [ProfileDropDown(name: name, items: items)],
//               //   ),
//               // ),
//               // Expanded(
//               //   child: GetBuilder<DepartmentController>(builder: (deptcontroller) {
//               //     return deptcontroller.departmentListIsLoading
//               //         ? const CircularProgressIndicator()
//               //         : Padding(
//               //       padding: const EdgeInsets.symmetric(
//               //           horizontal: 40, vertical: 35),
//               //       child: Column(
//               //           children: List.generate(
//               //               deptcontroller.departmentList.length, (index) {
//               //             return departmentRow(
//               //                 context,
//               //                 deptcontroller
//               //                     .departmentList[index].departmentName);
//               //           })),
//               //     );
//               //   }),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../app_theme.dart';
import '../../../app_url.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

class FirstFloorScreen extends StatefulWidget {
  const FirstFloorScreen({super.key});

  @override
  State<FirstFloorScreen> createState() => _FirstFloorScreenState();
}

class _FirstFloorScreenState extends State<FirstFloorScreen> {
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getFirstFloorAssets();
  }

  Future<void> getFirstFloorAssets() async {
    try {
      Dio dio = Dio();
      var url = AppUrl.baseUrl + AppUrl.firstFloorAsset;
      // var url = 'http://192.168.4.139:3000/asset/location/Ais-F1';
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
      ),      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(
                  title: 'First Floor  Assets Statistics',
                  showBackButton: true),
              OrangeButton(size: _size, title: "Add Asset", ontap: () {

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
    );
  }
}
