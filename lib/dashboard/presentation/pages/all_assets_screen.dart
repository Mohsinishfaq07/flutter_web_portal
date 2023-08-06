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
import 'package:web_portal/app_url.dart';
import '../../../app_theme.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';

// Existing code ...

class AllAssetScreen extends StatefulWidget {
  const AllAssetScreen({super.key});

  @override
  State<AllAssetScreen> createState() => _AllAssetScreenState();
}

class _AllAssetScreenState extends State<AllAssetScreen> {
  // List<Map> assets = [];
  List<Map<String, dynamic>> assets = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllAssets();
  }

  Future<void> getAllAssets() async {
    try {
      Dio dio = Dio();
      var url =AppUrl.baseUrl+AppUrl.allAsset;
      // var url = 'http://192.168.4.139:3000/asset/allAssets';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response);
        var responseData = response.data;
        print(responseData);
        if (responseData['asset_type'] is List) {
          setState(() {
            assets = List.from(responseData['asset_type']);
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(title: 'All Assets',showBackButton: true),

              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.assignAssetsToEmployees);
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
              const SizedBox(
                height: 10,
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade500),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(

                    // columnSpacing: MediaQuery.of(context).size.width * 0.11,
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
                          "Location Id",
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
