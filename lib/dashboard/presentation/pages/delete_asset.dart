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
//
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import '../../../app_url.dart';
import '../../../continue_button.dart';
import '../../../custom_text_form_field.dart';
import '../../../authentication/presentation/manager/auth_provider.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../app_assets.dart';
import 'package:http/http.dart' as http;

import 'dashboard_page.dart';

class DeleteAsset extends StatefulWidget {
  const DeleteAsset({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteAsset> createState() => _DeleteAssetState();
}

class _DeleteAssetState extends State<DeleteAsset> {
  final TextEditingController assetIdController = TextEditingController();
  final GlobalKey<FormState> _webDeleteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _tabDeleteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobileDeleteFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        duration: const Duration(milliseconds: 200),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return DeleteMobile(
                deleteFormKey: _mobileDeleteFormKey,
                assetIdController: assetIdController,
                authProvider: authProvider,
              );
            } else if (sizingInformation.isTablet) {
              return DeleteTab(
                size: size,
                deleteFormKey: _tabDeleteFormKey,
                assetIdController: assetIdController,
                authProvider: authProvider,
              );
            } else {
              return DeleteWeb(
                size: size,
                deleteFormKey: _webDeleteFormKey,
                assetIdController: assetIdController,
                authProvider: authProvider,
              );
            }
          },
        ),
      ),
    );
  }
}

class DeleteWeb extends StatefulWidget {
  const DeleteWeb({
    super.key,
    required Size size,

    required GlobalKey<FormState> deleteFormKey,
    required this.assetIdController,
    required AuthProvider authProvider,
  })  :
        _webDeleteFormKey = deleteFormKey;

  final GlobalKey<FormState> _webDeleteFormKey;
  final TextEditingController assetIdController;

  @override
  State<DeleteWeb> createState() => _DeleteWebState();
}

class _DeleteWebState extends State<DeleteWeb> {
  TextEditingController assetIdController = TextEditingController();

  Future<void> deleteAsset() async {
    var url = AppUrl.baseUrl + AppUrl.deleteAsset;
    var data = {
      "assetID": assetIdController.text,
      // "asset_name": assetNameController.text,
      // "user_id": userIdController.text,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeading(
                title: 'Delete Un-Assigned Asset', showBackButton: true),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: size.width != 900,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                  : size.width > 700
                                  ? 160
                                  : 0,
                              child: Image.asset(
                                "assets/images/png/ic_ais_logo.png",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  allowNumbersOnly: true,
                                  controller: assetIdController,
                                  width: 400,
                                  textInputType: TextInputType.number,
                                  hintText: "Asset Id",
                                  onChanged: (value) {},
                                  prefixIcon: Icon(
                                    Icons.laptop_chromebook,
                                    color: AppTheme.primaryColor,
                                  ),
                                  validator: (value) {},
                                ),
                                const SizedBox(height: 20),
                                ContinueButton(
                                  width: 400,
                                  text: "Delete Asset",
                                  ontap: () async {

                                     deleteAsset();

                                   },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ContinueButton(
                                  width: 400,
                                  text: "Cancel",
                                  ontap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.dashboard,
                                    );
                                  },
                                )
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
          ],
        ),
      ),
    );
  }
}


class DeleteTab extends StatefulWidget {
  const DeleteTab({
    super.key,
    required Size size,
    required GlobalKey<FormState> deleteFormKey,
    required this.assetIdController,
    required AuthProvider authProvider,
  })  : _size = size,
        _tabDeleteFormKey = deleteFormKey;

  final Size _size;
  final GlobalKey<FormState> _tabDeleteFormKey;
  final TextEditingController assetIdController;

  @override
  State<DeleteTab> createState() => _DeleteTabState();
}

class _DeleteTabState extends State<DeleteTab> {
  TextEditingController assetIdController = TextEditingController();

  Future<void> deleteAsset() async {
    var url = AppUrl.baseUrl + AppUrl.deleteAsset;
    var data = {
      "assetID": assetIdController.text,
      // "asset_name": assetNameController.text,
      // "user_id": userIdController.text,
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

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return  Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),        color: AppTheme.scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 5),
                child: Image.asset(
                  AppAssets.aislogo,
                  color: Colors.white,
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ),
              Text(
                'Delete Asset!',
                style: AppTheme.heading1
                    .copyWith(color: AppTheme.primaryColor, fontSize: 25),
              ),
              const Text(
                'Please provide Un-Assigned Asset id',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: widget._tabDeleteFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      allowNumbersOnly: true,
                      controller: authProvider.assetIdController,
                      width: MediaQuery.of(context).size.width *0.8,
                      textInputType: TextInputType.number,
                      hintText: "Asset Id",
                      onChanged: (value) {},
                      prefixIcon: Icon(
                        Icons.laptop_chromebook,
                        color: AppTheme.primaryColor,
                      ),
                      validator: (value) {},
                    ),
                    const SizedBox(height: 20),
                    ContinueButton(
                      width: MediaQuery.of(context).size.width *0.8,
                      text: "Save",
                      ontap: () async {
                        // if (widget._tabDeleteFormKey.currentState!.validate()) {
                        //   final authProvider =
                        //       Provider.of<AuthProvider>(context, listen: false);
                        //   await authProvider.deleteAsset(
                        //       context, );
                        //
                        //   final snackBar = SnackBar(
                        //     content: Text(
                        //       "Successfully Deleted in as ${authProvider.userName}",
                        //       style: const TextStyle(
                        //         color: Colors.blue,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     backgroundColor: AppTheme
                        //         .primaryColor, // Customize the background color
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // }
                        deleteAsset();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContinueButton(
                      width: MediaQuery.of(context).size.width *0.8,
                      text: "Cancel",
                      ontap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.adminPage);

                        // }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );

  }
}

class DeleteMobile extends StatefulWidget {
  const DeleteMobile({
    super.key,
    required GlobalKey<FormState> deleteFormKey,
    required this.assetIdController,
    required AuthProvider authProvider,
  }) : _mobileDeleteFormKey = deleteFormKey;

  final GlobalKey<FormState> _mobileDeleteFormKey;
  final TextEditingController assetIdController;

  @override
  State<DeleteMobile> createState() => _DeleteMobileState();
}

class _DeleteMobileState extends State<DeleteMobile> {
  String responseMessage = "";

  bool isExpanded = false;
  String selectedOption = "Select Your Role";
  TextEditingController assetIdController = TextEditingController();

  Future<void> deleteAsset() async {
    var url = AppUrl.baseUrl + AppUrl.deleteAsset;
    var data = {
      "assetID": assetIdController.text,
      // "asset_name": assetNameController.text,
      // "user_id": userIdController.text,
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
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const FlutterLogo(size: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 5),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Image.asset(
                        AppAssets.aislogo,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      )),
                ),

                const Text(
                  'Please add an Un_Assigned AssetId ',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: widget._mobileDeleteFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        allowNumbersOnly: true,
                        controller: authProvider.assetIdController,
                        width: 400,
                        textInputType: TextInputType.number,
                        hintText: "Asset Id",
                        onChanged: (value) {},
                        prefixIcon: Icon(
                          Icons.laptop_chromebook,
                          color: AppTheme.primaryColor,
                        ),
                        validator: (value) {},
                      ),
                      const SizedBox(height: 20),
                      ContinueButton(
                        width: 400,
                        text: "Save",
                        // ontap: () {
                        //   // if (_loginFormKey.currentState!.validate()) {
                        //
                        //   // }
                        //
                        //   deleteAsset();
                        //   print(
                        //       "Delete Asset function is running ");
                        // },
                        ontap: () async {
                          deleteAsset();
                          // if (widget._mobileDeleteFormKey.currentState!
                          //     .validate()) {
                          //   final authProvider = Provider.of<AuthProvider>(
                          //       context,
                          //       listen: false);
                          //   await authProvider.deleteAsset(
                          //       context,);
                          //
                          //   final snackBar = SnackBar(
                          //     content: Text(
                          //       "Successfully Deleted in as ${authProvider.userName}",
                          //       style: const TextStyle(
                          //         color: Colors.blue,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     backgroundColor: AppTheme
                          //         .primaryColor, // Customize the background color
                          //   );
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                          // }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ContinueButton(
                        width: 400,
                        text: "Cancel",
                        ontap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.adminPage);

                          // }
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
