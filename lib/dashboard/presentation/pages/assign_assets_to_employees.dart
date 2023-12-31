// import 'package:flutter/material.dart';
// import '../../../app_theme.dart';
// import '../../../colors.dart';
// import '../../../continue_button.dart';
// import '../../../custom_text_form_field.dart';
// import '../widgets/admin_section_heading.dart';
// import '../widgets/department_controller.dart';
// import '../widgets/routes.dart';
//
// class AssignAssetsToEmployees extends StatelessWidget {
//   TextEditingController assetController = TextEditingController();
//   TextEditingController modelNoController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF23BCBA).withOpacity(0.09),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//                 child: Text(
//                   "Assign Assets  ",
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleLarge!
//                       .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(color: AppTheme.primaryColor),
//                           borderRadius: BorderRadius.circular(30)),
//                       child: Icon(
//                         Icons.close,
//                         color: AppTheme.primaryColor,
//                         size: 18,
//                       )),
//                 ),
//               ),
//               SizedBox(height: 5),
//
//               TextFormField(
//                 controller: assetController,
//                 decoration: InputDecoration(
//                   hintText: "email",
//                   suffixIcon: Icon(
//                     Icons.alternate_email,
//                     color: AppTheme.primaryColor,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.email_outlined,
//                     color: AppTheme.primaryColor,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   // You can add more validation logic here
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 25),
//               CustomTextFormField(
//                 allowNumbersOnly: true,
//
//                 controller: assetController,
//                 height: 55,
//                 width: double.infinity,
//                 hintText: "Asset Type",
//                 onChanged: (value) {},
//                 prefixIcon: Icon(
//                   Icons.laptop_chromebook,
//                   color: AppTheme.primaryColor,
//                 ),
//                 validator: (value) {},
//               ),
//               const SizedBox(height: 25),
//               CustomTextFormField(
//                 allowNumbersOnly: true,
//
//                 controller: assetController,
//                 height: 55,
//                 width: double.infinity,
//                 hintText: "Asset Id",
//                 onChanged: (value) {},
//                 prefixIcon: Icon(
//                   Icons.laptop_chromebook,
//                   color: AppTheme.primaryColor,
//                 ),
//                 validator: (value) {},
//               ),
//               const SizedBox(height: 25),
//               CustomTextFormField(
//                 height: 55,
//                 allowNumbersOnly: false,
//
//                 width: double.infinity,
//                 onChanged: (value) {},
//                 hintText: "Model ",
//                 prefixIcon: Icon(
//                   Icons.warning,
//                   color: AppTheme.primaryColor,
//                 ),
//                 validator: (value) {},
//                 controller: modelNoController,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               CustomTextFormField(
//                 height: 55,                allowNumbersOnly: true,
//
//                 width: double.infinity,
//                 onChanged: (value) {},
//                 hintText: "Location ",
//                 prefixIcon: Icon(
//                   Icons.warning,
//                   color: AppTheme.primaryColor,
//                 ),
//                 validator: (value) {},
//                 controller: modelNoController,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               CustomTextFormField(
//                 height: 55,                allowNumbersOnly: true,
//
//                 width: double.infinity,
//                 onChanged: (value) {},
//                 hintText: "Employee id  ",
//                 prefixIcon: Icon(
//                   Icons.warning,
//                   color: AppTheme.primaryColor,
//                 ),
//                 validator: (value) {},
//                 controller: modelNoController,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ContinueButton(
//                 text: "Save",
//                 ontap: () {
//                   // loginUser();
//                   // if (_loginFormKey.currentState!.validate()) {
//                   //   context.read<AuthProvider>().loginUser(loginEmailController.text, loginPasswordController.text);
//                   //   // Uncomment the following code for handling the login process
//                   //   // String email = loginEmailController.text;
//                   // String password = loginPasswordController.text;
//                   // final authProvider = Provider.of<AuthProvider>(context, listen: false);
//                   // authProvider.loginUser(context, email, password);
//
//                   // Uncomment the following code to navigate to the admin page
//                   Navigator.pushReplacementNamed(context, Routes.adminPage);
//
//
//                   // }
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ContinueButton(
//                 text: "Cancel",
//                 ontap: () {
//                   // loginUser();
//                   // if (_loginFormKey.currentState!.validate()) {
//                   //   context.read<AuthProvider>().loginUser(loginEmailController.text, loginPasswordController.text);
//                   //   // Uncomment the following code for handling the login process
//                   //   // String email = loginEmailController.text;
//                   // String password = loginPasswordController.text;
//                   // final authProvider = Provider.of<AuthProvider>(context, listen: false);
//                   // authProvider.loginUser(context, email, password);
//
//                   // Uncomment the following code to navigate to the admin page
//                   Navigator.pushReplacementNamed(context, Routes.adminPage);
//
//
//                   // }
//                 },
//               ),
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
// //
// // Card departmentRow(BuildContext context, String name) {
// //   return Card(
// //     child: ListTile(
// //       leading: const Icon(
// //         Icons.people_rounded,
// //         size: 50,
// //       ),
// //       isThreeLine: true,
// //       title: AdminSectionHeading(context, 5, 0, name, 20),
// //       subtitle: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 10),
// //         child: AdminSubHeading(context, "Click to see all agents", 15),
// //       ),
// //     ),
// //   );
// // }
// }
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_portal/app_url.dart';
import '../../../app_theme.dart';
import '../../../colors.dart';
import '../../../continue_button.dart';
import '../../../custom_text_form_field.dart';
import '../widgets/routes.dart';
import 'package:http/http.dart' as http;

import 'assets_statistics.dart';

class AssignAssets extends StatefulWidget {
  const AssignAssets({super.key});
  @override
  State<AssignAssets> createState() => _AssignAssetsState();
}

class _AssignAssetsState extends State<AssignAssets> {
  TextEditingController assetIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();

  Future<void> assignAssets() async {
    var url = AppUrl.baseUrl + AppUrl.assignAsset;
    var data = {
      "assetID": assetIdController.text,
      // "asset_name": assetNameController.text,
      "user_id": userIdController.text,
      // "assetID": 54,
      // "asset_name": "samsung",
      // "user_id": 25,
    };
    try {
      Dio dio = Dio();
      print(data);
      var response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print('Asset Assigned Successful!');
        print('Response data: ${response.data}');
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      } else {
        print(response.statusCode);
        // Error handling for failed response status code
        print('Request failed with status: ${response}');
        // Show appropriate message to the user
        if (response.statusCode == 401) {
          // Unauthorized, invalid credentials
          print('Invalid credentials. Please try again.');
        } else {
          // Handle other error scenarios...
          print('Something went wrong. Please try again later.');
        }
      }
    } catch (e) {
      // Error handling for network issues or other exceptions
      print('Error: $e');
      print('Network error. Please check your internet connection.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade600),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(title: 'Assign Assets to employees',showBackButton: true),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                double imageWidth = constraints.maxWidth;
                                return Visibility(
                                  visible: imageWidth != 700,
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: SizedBox(
                                          height: _size.width > 1200
                                              ? 260
                                              : _size.width > 1000
                                                  ? 240
                                                  : _size.width > 900
                                                      ? 220
                                                      : _size.width > 800
                                                          ? 200
                                                          : _size.width > 750
                                                              ? 180
                                                              : _size.width >
                                                                      700
                                                                  ? 160
                                                                  : 0,

                                          // height: _size.width > 1300 ? 200:50,
                                          child: Image.asset(
                                              "assets/images/png/ic_ais_logo.png")),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    // Align(
                                    //   alignment: Alignment.centerRight,
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       Navigator.pop(context);
                                    //     },
                                    //     child: Container(
                                    //         decoration: BoxDecoration(
                                    //             border:
                                    //                 Border.all(color: AppTheme.primaryColor),
                                    //             borderRadius: BorderRadius.circular(30)),
                                    //         child: Icon(
                                    //           Icons.close,
                                    //           color: AppTheme.primaryColor,
                                    //           size: 18,
                                    //         )),
                                    //   ),
                                    // ),
                                    // const SizedBox(height: 10),
                                    const SizedBox(height: 20),

                                    CustomTextFormField(
                                      allowNumbersOnly: true,
                                      controller: assetIdController,
                                      height: 55,
                                      textInputType: TextInputType.number,
                                      width: double.infinity,
                                      hintText: "Asset Id",
                                      onChanged: (value) {},
                                      prefixIcon: Icon(
                                        Icons.laptop_chromebook,
                                        color: AppTheme.primaryColor,
                                      ),
                                      validator: (value) {},
                                    ),
                                    const SizedBox(height: 10),
                                    // CustomTextFormField(
                                    //   allowNumbersOnly: false,
                                    //   controller: assetNameController,
                                    //   height: 55,
                                    //   width: double.infinity,
                                    //   hintText: "Asset Name",
                                    //   textInputType: TextInputType.name,
                                    //   onChanged: (value) {},
                                    //   prefixIcon: Icon(
                                    //     Icons.laptop_chromebook,
                                    //     color: AppTheme.primaryColor,
                                    //   ),
                                    //   validator: (value) {},
                                    // ),
                                    // const SizedBox(height: 10),
                                    CustomTextFormField(
                                      allowNumbersOnly: false,
                                      controller: userIdController,
                                      height: 55,
                                      width: double.infinity,
                                      hintText: "user id",
                                      textInputType: TextInputType.name,
                                      onChanged: (value) {},
                                      prefixIcon: Icon(
                                        Icons.laptop_chromebook,
                                        color: AppTheme.primaryColor,
                                      ),
                                      validator: (value) {},
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ContinueButton(
                                      text: "Save",
                                      ontap: () {
                                        // if (_loginFormKey.currentState!.validate()) {

                                        // }
                                        assignAssets();
                                        print(
                                            "Assign Asset function is running ");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ContinueButton(
                                      text: "Cancel",
                                      ontap: () {
                                        Navigator.pushReplacementNamed(
                                            context, Routes.adminPage);

                                        // }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
