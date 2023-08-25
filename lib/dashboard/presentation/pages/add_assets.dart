import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/app_url.dart';
import '../../../app_theme.dart';
import '../../../continue_button.dart';
import '../../../custom_text_form_field.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/routes.dart';
import 'package:http/http.dart' as http;

import 'assets_statistics.dart';
import 'dashboard_page.dart';

class AddAssets extends StatefulWidget {
  const AddAssets({super.key});
  @override
  State<AddAssets> createState() => _AddAssetsState();
}

class _AddAssetsState extends State<AddAssets> {
  TextEditingController assetNameController = TextEditingController();
  TextEditingController assetTypeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isExpanded = false;
  bool isExpanded2 = false;
  int selectedfloor = 0;
  String selectedOption = "Select Asset Type";
  String selectedOption2 = "Select location";
  Map<String, int> optionValues = {
    "Chair": 1,
    "Laptop": 2,
    "Bag": 3,
    "Internet Device": 4,
    "Mobile Phone": 5,
  };
  Map<String, int> optionValues2 = {
    "Ais-Floor-1": 1,
    "Ais-Floor-2": 2,
  };
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
  Future<void> createAsset() async {
    var url = AppUrl.baseUrl + AppUrl.createAsset;
    var data = {
      "asset_name": assetNameController.text,
      "asset_type_id": optionValues[assetTypeController.text],
      "location_id": optionValues2[locationController.text],
    };
    try {
      Dio dio = Dio();
      print(data);
      var response = await dio.post(
        url,
        data: data,
      );
      //  var response = await dio.post(url, data: bodyy, options: Options(
      //      method: "post",
      //      contentType: "application/json",responseType: ResponseType.json));

      if (response.statusCode == 200) {
        // Successful response
        // var responseData = json.decode(response.data);
        // Process the responseData here...
        print('Asset Created Successful!');
        print('Response data: ${response.data}');
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      } else {
        // Error handling for failed response status code
        print('Request failed with status: ${response.statusCode}');
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

    // final url = Uri.parse('http://192.168.4.120:3000/asset/create_asset');

    // Replace the following with the data you want to send in the request body
    // final Map<String, dynamic> requestData = {
    //   'asset_name': 'My Asset',
    //   'asset_type': 'Computer',
    //   // Add more data as needed
    // };
    //
    // final headers = {'Content-Type': 'application/json'};
    // final requestBody = json.encode(requestData);

    // try {
    //   final response = await http.post(url, headers: headers, body: requestBody);
    //
    //   if (response.statusCode == 200) {
    //     // Asset created successfully
    //     print('Asset created successfully');
    //     print(response.body);
    //   } else {
    //     // Error creating the asset
    //     print('Error creating the asset: ${response.statusCode}');
    //     print(response.body);
    //   }
    // } catch (e) {
    //   // Error occurred during the request
    //   print('Error occurred during the request: $e');
    // }
  }



  @override
  Widget build(BuildContext context) {
    dashboardProvider??= Provider.of<DashboardProvider>(context);

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),        color: AppTheme.scaffoldBackgroundColor,
      ),      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const CustomHeading(
                          title: 'Add Assets', showBackButton: true),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              double imageWidth = constraints.maxWidth;
                              return Visibility(
                                visible: imageWidth != 1000,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey),
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

                                        // height: _size.width > 1300 ? 200:50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                              "assets/images/png/ic_ais_logo.png"),
                                        )),
                                  ),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white10),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      CustomTextFormField(
                                        prefixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          child: Icon(
                                            Icons.person_pin,
                                            color: AppTheme.primaryColor,
                                          ),
                                        ),
                                        controller: assetTypeController,
                                        allowNumbersOnly: false,
                                        validator: (value) {},
                                        readonly: true,
                                        hintText: selectedOption,
                                      ),
                                      if (isExpanded)
                                        Container(
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey,
                                            border: Border.all(color: Colors.grey.shade100)
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: const Text("Chair"),
                                                  leading: const Icon(
                                                    Icons.add_box_rounded,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      assetTypeController.text =
                                                          "Chair";
                                                      isExpanded = false;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: double.infinity,
                                                  color: Colors
                                                      .black, // Customize the color of the horizontal line
                                                ),
                                                ListTile(
                                                  title: const Text("Laptop"),
                                                  leading: const Icon(Icons.add_box_rounded,),

                                                  onTap: () {
                                                    setState(() {
                                                      assetTypeController.text =
                                                          "Laptop";
                                                      isExpanded = false;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: double.infinity,
                                                  color: Colors
                                                      .black, // Customize the color of the horizontal line
                                                ),
                                                ListTile(
                                                  title: const Text("Bag"),
                                                  leading: const Icon(Icons.add_box_rounded,),

                                                  onTap: () {
                                                    setState(() {
                                                      assetTypeController.text =
                                                          "Bag";
                                                      isExpanded = false;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: double.infinity,
                                                  color: Colors
                                                      .black, // Customize the color of the horizontal line
                                                ),
                                                ListTile(
                                                  title: const Text(
                                                      "Internet Device"),
                                                  leading: const Icon(Icons.add_box_rounded,),

                                                  onTap: () {
                                                    setState(() {
                                                      assetTypeController.text =
                                                          "Internet Device";
                                                      isExpanded = false;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: double.infinity,
                                                  color: Colors
                                                      .black, // Customize the color of the horizontal line
                                                ),
                                                ListTile(
                                                  title: const Text(
                                                      "Mobile Phone"),
                                                  leading: const Icon(Icons.add_box_rounded,),

                                                  onTap: () {
                                                    setState(() {
                                                      assetTypeController.text =
                                                          "Mobile Phone";
                                                      isExpanded = false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      const SizedBox(height: 10),
                                      CustomTextFormField(
                                        allowNumbersOnly: false,
                                        controller: assetNameController,
                                        height: 55,
                                        width: double.infinity,
                                        hintText: "Asset Name",
                                        textInputType: TextInputType.name,
                                        onChanged: (value) {},
                                        prefixIcon: Icon(
                                          Icons.laptop_chromebook,
                                          color: AppTheme.primaryColor,
                                        ),
                                        validator: (value) {},
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        child: CustomTextFormField(
                                          prefixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpanded2 = !isExpanded2;
                                              });
                                            },
                                            child: Icon(
                                              Icons.bike_scooter,
                                              color: AppTheme.primaryColor,
                                            ),
                                          ),
                                          controller: locationController,
                                          allowNumbersOnly: false,
                                          validator: (value) {},
                                          readonly: true,
                                          hintText: selectedOption2,
                                        ),
                                      ),
                                      if (isExpanded2)
                                        Container(
                                          // height: MediaQuery.of(context).size.height * 0.12,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: Colors.grey,
                                              border: Border.all(color: Colors.grey.shade100)
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text("Ais-Floor-1"),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedfloor =
                                                          optionValues2['Ais-Floor-1']!;
                                                      locationController.text = "Ais-Floor-1";

                                                      isExpanded2 = false;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: double.infinity,
                                                  color: Colors
                                                      .black, // Customize the color of the horizontal line
                                                ),
                                                ListTile(
                                                  title: Text("Ais-Floor-2"),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedfloor =
                                                          optionValues2[
                                                              'Ais-Floor-2']!;

                                                      locationController.text =
                                                          "Ais-Floor-2";
                                                      isExpanded2 = false;
                                                    });
                                                  },
                                                ),

                                              ],
                                            ),
                                            // Replace with your desired title
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ContinueButton(
                                        text: "Save",
                                        ontap: () {
                                          print(
                                              "asset saved  function  running  ");

                                          createAsset();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ContinueButton(
                                        text: "Cancel",
                                        ontap: () {
                                          // loginUser();
                                          // if (_loginFormKey.currentState!.validate()) {
                                          //   context.read<AuthProvider>().loginUser(loginEmailController.text, loginPasswordController.text);
                                          //   // Uncomment the following code for handling the login process
                                          //   // String email = loginEmailController.text;
                                          // String password = loginPasswordController.text;
                                          // final authProvider = Provider.of<AuthProvider>(context, listen: false);
                                          // authProvider.loginUser(context, email, password);

                                          // Uncomment the following code to navigate to the admin page
                                          Navigator.pushReplacementNamed(
                                              context, Routes.dashboard);

                                          // }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )

                          //? NAVBAR  IS HERE

                          // Container(
                          //   height: 60,
                          //   color: klightbg,
                          //   child: const Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     //TODO ADD DEPT DROPDOWN HERE
                          //     // children: [ProfileDropDown(name: name, items: items)],
                          //   ),
                          // ),
                          // Expanded(
                          //   child: GetBuilder<DepartmentController>(builder: (deptcontroller) {
                          //     return deptcontroller.departmentListIsLoading
                          //         ? const CircularProgressIndicator()
                          //         : Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 40, vertical: 35),
                          //       child: Column(
                          //           children: List.generate(
                          //               deptcontroller.departmentList.length, (index) {
                          //             return departmentRow(
                          //                 context,
                          //                 deptcontroller
                          //                     .departmentList[index].departmentName);
                          //           })),
                          //     );
                          //   }),
                          // ),
                        ],
                      ),
                    ],
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
