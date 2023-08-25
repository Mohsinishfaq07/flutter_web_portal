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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/app_url.dart';
import '../../../app_theme.dart';
import '../../../continue_button.dart';
import '../../../custom_text_form_field.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/routes.dart';

import 'assets_statistics.dart';
import 'dashboard_page.dart';

class UnAssignAsset extends StatefulWidget {
  const UnAssignAsset({super.key});
  @override
  State<UnAssignAsset> createState() => _UnAssignAssetState();
}

class _UnAssignAssetState extends State<UnAssignAsset> {
  TextEditingController assetIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();

  Future<void> unAssignAsset() async {
    var url = AppUrl.baseUrl + AppUrl.unAssignAsset;
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
      var response = await dio.delete(url, data: data);
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

  DashboardProvider? dashboardProvider ;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {



    });}
  @override
  void dispose() {
    print("asdfghjkl");
    dashboardProvider!.removePage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dashboardProvider??= Provider.of<DashboardProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: AppTheme.scaffoldBackgroundColor,
      ),      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeading(
                  title: 'Un-Assign Assets', showBackButton: true),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,

                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                            border: Border.all(color: Colors.white10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
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
                                            height: size.width > 1200
                                                ? 260
                                                : size.width > 1000
                                                    ? 240
                                                    : size.width > 900
                                                        ? 220
                                                        : size.width > 800
                                                            ? 200
                                                            : size.width > 750
                                                                ? 180
                                                                : size.width >
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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppTheme.primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        CustomTextFormField(
                                          allowNumbersOnly: true,
                                          controller: assetIdController,
                                          textInputType: TextInputType.number,
                                          width: 400,
                                          hintText: "Asset Id",
                                          onChanged: (value) {},
                                          prefixIcon: Icon(
                                            Icons.laptop_chromebook,
                                            color: AppTheme.primaryColor,
                                          ),
                                          validator: (value) {},
                                        ),
                                        const SizedBox(height: 10),
                                        CustomTextFormField(
                                          allowNumbersOnly: false,
                                          controller: userIdController,
                                          height: 55,
                                          width: 400,

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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          text: "Save",
                                          ontap: () {
                                            // if (_loginFormKey.currentState!.validate()) {

                                            // }
                                            unAssignAsset();
                                            print(
                                                "Delete Asset function is running ");
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ContinueButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          text: "Cancel",
                                          ontap: () {
                                            Navigator.pushReplacementNamed(
                                                context, Routes.dashboard);

                                            // }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
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
