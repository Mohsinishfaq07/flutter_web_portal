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
import '../../../continue_button.dart';
import '../../../custom_text_form_field.dart';
import '../../../authentication/presentation/manager/auth_provider.dart';
import '../widgets/routes.dart';
import 'assets_statistics.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../app_assets.dart';
import 'package:http/http.dart' as http;

class CreateScrapScreen extends StatefulWidget {
  const CreateScrapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateScrapScreen> createState() => _CreateScrapScreenState();
}

class _CreateScrapScreenState extends State<CreateScrapScreen> {
  final TextEditingController assetIdController = TextEditingController();
  final GlobalKey<FormState> _webCreateScrapFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _tabCreateScrapFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobileCreateScrapFormKey = GlobalKey<FormState>();
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
              return CreateScrapMobile(
                deleteFormKey: _mobileCreateScrapFormKey,
                assetIdController: assetIdController,
                authProvider: authProvider,
              );
            } else if (sizingInformation.isTablet) {
              return CreateScrapTab(
                size: size,
                deleteFormKey: _tabCreateScrapFormKey,
                assetIdController: assetIdController,
                authProvider: authProvider,
              );
            } else {
              return CreateScrapWeb(
                size: size,
                deleteFormKey: _webCreateScrapFormKey,
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

class CreateScrapWeb extends StatefulWidget {
  const CreateScrapWeb({
    super.key,
    required Size size,
    required GlobalKey<FormState> deleteFormKey,
    required this.assetIdController,
    required AuthProvider authProvider,
  })  : _size = size,
        _webDeleteFormKey = deleteFormKey;

  final Size _size;
  final GlobalKey<FormState> _webDeleteFormKey;
  final TextEditingController assetIdController;

  @override
  State<CreateScrapWeb> createState() => _CreateScrapWebState();
}

class _CreateScrapWebState extends State<CreateScrapWeb> {

  Future<void> moveToScrap(BuildContext context, String assetId ) async {
    try {
      var url = 'http://192.168.5.27:3000/asset/mark_scrap/$assetId';
      Dio dio = Dio();
      var response = await dio.put(url);

      if (response.statusCode == 200) {
        // Handle successful response
        print('Asset moved to scrap successfully');
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      } else {
        // Handle error scenarios
        print('Failed to move asset to scrap');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }

}

  @override
  void dispose() {
    widget.assetIdController.dispose(); // Dispose the controller
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(color: AppTheme.scaffoldBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeading(
                title: 'Move Un-Assigned Asset to scrap', showBackButton: true),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),

                             child: Visibility(
                                  visible: size.width != 900,
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

                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    allowNumbersOnly: true,
                                    controller: widget.assetIdController,
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
                                    text: "Add to scrap",

                                    ontap: () async {
                                      moveToScrap(context, widget.assetIdController.text);

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
    );
  }
}

class CreateScrapTab extends StatefulWidget {
  const CreateScrapTab({
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
  State<CreateScrapTab> createState() => _CreateScrapTabState();
}

class _CreateScrapTabState extends State<CreateScrapTab> {
  TextEditingController assetIdController = TextEditingController();
  Future<void> moveToScrap(BuildContext context, String assetId) async {
    try {
      String url = 'http://192.168.5.27:3000/asset/mark_scrap/$assetId';
      Dio dio = Dio();
      var response = await dio.put(url);

      if (response.statusCode == 200) {
        // Handle successful response
        print('Asset moved to scrap successfully');
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      } else {
        // Handle error scenarios
        print('Failed to move asset to scrap');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
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
                        controller:  assetIdController,
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
                          moveToScrap(context,assetIdController.text);
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
        ),
      ),
    );
  }
}

class CreateScrapMobile extends StatefulWidget {
  const CreateScrapMobile({
    super.key,
    required GlobalKey<FormState> deleteFormKey,
    required this.assetIdController,
    required AuthProvider authProvider,
  }) : _mobileDeleteFormKey = deleteFormKey;

  final GlobalKey<FormState> _mobileDeleteFormKey;
  final TextEditingController assetIdController;

  @override
  State<CreateScrapMobile> createState() => _CreateScrapMobileState();
}

class _CreateScrapMobileState extends State<CreateScrapMobile> {
  TextEditingController assetIdController = TextEditingController();
  Future<void> moveToScrap(BuildContext context, String assetId) async {
    try {
      String url = 'http://192.168.5.27:3000/asset/mark_scrap/$assetId';
      Dio dio = Dio();
      var response = await dio.put(url);

      if (response.statusCode == 200) {
        // Handle successful response
        print('Asset moved to scrap successfully');
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      } else {
        // Handle error scenarios
        print('Failed to move asset to scrap');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }

  }


  String responseMessage = "";

  bool isExpanded = false;
  String selectedOption = "Select Your Role";

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
                     moveToScrap(context, assetIdController.text);
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
