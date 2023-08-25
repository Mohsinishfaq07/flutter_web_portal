import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/custom_text_form_field.dart';
import 'package:web_portal/dashboard/presentation/pages/second_floor_assets.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_asset.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assign_employees.dart';
import 'package:web_portal/dashboard/presentation/pages/un_assigned_assets.dart';
import '../../../authentication/presentation/pages/log_in_page.dart';
import '../../../colors.dart';
import '../manager/dashboard_provider.dart';
import '../widgets/local_navigator.dart';
import '../widgets/routes.dart';
import 'add_assets.dart';
import 'all_assets_screen.dart';
import 'assets_statistics.dart';
import 'assign_assets_to_employees.dart';
import 'assigned_employees.dart';
import 'delete_asset.dart';
import 'first_floor.dart';
import 'history_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isExpanded = false;
  int isHovering = 0;
  int selectedOption = 0;
  String selectOption = "Select Asset Type";
  bool isDropdownVisible = false;
  DashboardProvider? dashboardProvider;

  Map<String, dynamic>? selectedUser;
   bool isSearchActive = false;
  TextEditingController assetTypeController = TextEditingController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardProvider!.getAssignedUserCount();
      dashboardProvider!.getUnAssignedUserCount();
      searchController.addListener(() {
        final query = searchController.text;
        dashboardProvider!.performUserSearch(query);
      });
    });
  }

  @override
  void dispose() {
    dashboardProvider!.removePage();
    super.dispose();
  }

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dashboardProvider ??= Provider.of<DashboardProvider>(context);

    return ChangeNotifierProvider.value(
      value: dashboardProvider,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: AppTheme.scaffoldBackgroundColor,
        ),
         child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    " Dashboard ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Column(children: [
                  CustomTextFormField(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        dashboardProvider?.performUserSearch('');

                        setState(() {
                          selectedUser = null;
                          isSearchActive = true;
                          isDropdownVisible = !isDropdownVisible;
                        });
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white54,
                      ),
                    ),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       if (!isDropdownVisible) {
                    //         isDropdownVisible = true;
                    //         isSearchActive = true;
                    //       } else {
                    //         isDropdownVisible = false;
                    //         isSearchActive = false;
                    //         selectedUser = null;
                    //       }
                    //     });
                    //   },
                    //   child: isSearchActive
                    //       ? Icon(
                    //     Icons.close,
                    //     color: Colors.white54,
                    //   )
                    //       : Icon(
                    //     Icons.search,
                    //     color: Colors.white54,
                    //   ),
                    // ),
                    hintText: "Employee Name ",
                    controller: searchController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Employee name ';
                      }

                      return null;
                    },
                    onChanged: (query) {
                      if (query.isEmpty) {
                        setState(() {
                          isDropdownVisible = false;
                        });
                        return;
                      }
                      dashboardProvider?.performUserSearch(query);
                    },
                    allowNumbersOnly: false,
                  ),
                  if (isSearchActive && isDropdownVisible)
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSearchActive = false;
                                  isDropdownVisible = false;
                                });
                              },
                            ),
                          ),
                           if (dashboardProvider?.userSearch.isEmpty ?? false)
                            const Text(
                              'No User Data Found',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: dashboardProvider?.userSearch.length,
                            itemBuilder: (context, index) {
                              final user =
                                  dashboardProvider?.userSearch[index];
                              final firstName = user?['first_name'];
                              final lastName = user?['last_name'];
                              final email = user?['email'];
                              final employeeId = user?['id'];
                              return Card(
                                color: Colors.grey,
                                elevation: 3,
                                child: ListTile(
                                  title: Text(
                                      '$firstName $lastName'), // Display both first and last name
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email: $email'),
                                      Text('Employee ID: $employeeId'),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedUser =
                                          user; // Store the selected user data
                                      searchController.text =
                                          '$firstName $lastName';
                                      isDropdownVisible = !isDropdownVisible;
                                      // Update the TextField
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ]),
                Visibility(
                  visible:
                      selectedUser != null && searchController.text.isNotEmpty,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white54,
                            ),
                            onPressed: () {
                              setState(() {
                                searchController.clear();

                                selectedUser = null;
                                isDropdownVisible = false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade500),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columnSpacing: MediaQuery.of(context).size.width * 0.06,

                              columns: [
                                DataColumn(
                                  label: Text(
                                    "User id ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "First Name ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Last Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Asset id",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Asset Name ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Asset Type ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
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
                                DataColumn(
                                  label: Text(
                                    "Email ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryColor),
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['id']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['first_name']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['last_name']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['asset_id']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['asset_name']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['asset_type']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['floor_location']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        selectedUser != null
                                            ? ' ${selectedUser?['email']} '
                                            : '',
                                        style: TextStyle(
                                          color: (selectedUser != null &&
                                                  searchController
                                                      .text.isNotEmpty)
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
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
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    " Choose Category ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomTextFormField(
                  prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                        dashboardProvider?.chooseCategory(0);

                      });
                    },
                    child: Icon(
                      Icons.person_pin,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                          dashboardProvider?.chooseCategory(0);

                        });
                      },
                      child: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.grey,)),
                  controller: assetTypeController,
                  allowNumbersOnly: false,
                  validator: (value) {},
                  readonly: true,
                  hintText: selectOption,
                  // onChanged: (assetValue){
                  // },
                ),
                if (isExpanded)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey.shade100)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("Chair"),
                            leading: const Icon(
                              Icons.add_box_rounded,
                            ),
                            onTap: () {
                              dashboardProvider?.chooseCategory(1);

                              setState(() {
                                assetTypeController.text = "Chair";
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
                            leading: const Icon(
                              Icons.add_box_rounded,
                            ),
                            onTap: () {
                              dashboardProvider?.chooseCategory(2);

                              setState(() {
                                //
                                // selectedAssetType = "2";
                                assetTypeController.text = "Laptop";
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
                            leading: const Icon(
                              Icons.add_box_rounded,
                            ),
                            onTap: () {
                              dashboardProvider?.chooseCategory(3);

                              setState(() {
                                // selectedAssetType = "3";
                                assetTypeController.text = "Bag";
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
                            title: const Text("Internet Device"),
                            leading: const Icon(
                              Icons.add_box_rounded,
                            ),
                            onTap: () {
                              dashboardProvider?.chooseCategory(4);

                              setState(() {
                                // selectedAssetType = "4";
                                assetTypeController.text = "Internet Device";
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
                            title: const Text("Mobile Phone"),
                            leading: const Icon(
                              Icons.add_box_rounded,
                            ),
                            onTap: () {
                              dashboardProvider?.chooseCategory(5);
                              setState(() {
                                // selectedAssetType = "5";
                                assetTypeController.text = "Mobile Phone";
                                isExpanded = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                Consumer<DashboardProvider>(builder: (context, value, child) {
                if (dashboardProvider!.assets.isEmpty) {
                    return const SizedBox(); // Hide if there are no assets
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                              onPressed: () {
                                setState(() {
                                  dashboardProvider?.chooseCategory(0);
                                  assetTypeController.clear();
                                });
                              },
                            ),
                          ),
                          Container(
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade500),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: MediaQuery.of(context).size.width * 0.06,


                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "Serial number",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.primaryColor),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Asset ID ",
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
                                    label: Text(
                                      "Asset Type ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.primaryColor),
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
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "Status",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.primaryColor),
                                        ),
                                        const Icon(Icons.architecture),
                                      ],
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  dashboardProvider!.assets!.length,
                                  (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                              " ${dashboardProvider!.assets[index]['serial_no'] ?? 'N/A'}"),
                                        ),
                                        DataCell(
                                          Text(
                                              " ${dashboardProvider!.assets[index]['asset_id'] ?? 'N/A'}"),
                                        ),
                                        DataCell(
                                          Text(
                                              "  ${dashboardProvider!.assets[index]['asset_name'] ?? 'N/A'}"),
                                        ),
                                        DataCell(
                                          Text(
                                              " ${dashboardProvider!.assets[index]['type_name'] ?? 'N/A'}"),
                                        ),
                                        DataCell(
                                          Text(
                                              " ${dashboardProvider!.assets[index]['floor_location'] ?? 'N/A'}"),
                                        ),
                                        DataCell(
                                          Text(
                                              " ${dashboardProvider!.assets[index]['assigned_user'] ?? 'N/A'}"),
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
                    );
                  }
                }),
                const CustomHeading(
                    title: 'Employee Details', showBackButton: false),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MouseRegion(
                        opaque: true,
                        onEnter: (event) {
                          setState(() {
                            isHovering = 1;
                            selectedOption = 1;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHovering = 0;
                            selectedOption = 0;
                          });
                        },
                        child: CustomDashboardContainer(
                          title: 'Un-Assigned Employees',
                          quantity: context
                              .watch<DashboardProvider>()
                              .unAssignedUserCount,
                          ontap: () {
                            selectedOption = 1;

                            localNavigator
                                .navigateTo(Routes.unAssignedEmployees);
                          },
                          color: selectedOption == 1
                              ? primaryColor
                              : Colors.grey.shade600,
                        ),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.01,
                      // ),
                      Consumer<DashboardProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 2;
                                selectedOption = 2;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              title: 'Assigned Employees',
                              quantity: context
                                  .read<DashboardProvider>()
                                  .assignedUserCount,
                              ontap: () {
                                setState(() {
                                  selectedOption = 2;
                                });

                                localNavigator
                                    .navigateTo(Routes.assignedEmployees);
                              },
                              color: selectedOption == 2
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const CustomHeading(
                    title: 'Asset Statistics', showBackButton: false),
                Consumer<DashboardProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MouseRegion(
                          opaque: true,
                          onEnter: (event) {
                            setState(() {
                              isHovering = 5;
                              selectedOption = 5;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              isHovering = 0;
                              selectedOption = 0;
                            });
                          },
                          child: CustomDashboardContainer(
                              title: 'Assets Statistics',
                              ontap: () {
                                setState(() {
                                  selectedOption = 5;
                                });
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(2);
                                localNavigator
                                    .navigateTo(Routes.assetsStatistics);
                              },
                              color: selectedOption == 5
                                  ? primaryColor
                                  : Colors.grey.shade600),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.01,
                        // ),
                        Consumer<DashboardProvider>(builder:
                            (BuildContext context, value, Widget? child) {
                          return MouseRegion(
                            opaque: true,
                            onEnter: (event) {
                              setState(() {
                                isHovering = 3;
                                selectedOption = 3;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                isHovering = 0;
                                selectedOption = 0;
                              });
                            },
                            child: CustomDashboardContainer(
                              title: 'Assign Assets ',
                              ontap: () {
                                setState(() {
                                  selectedOption = 3;
                                });
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(4);

                                localNavigator
                                    .navigateTo(Routes.assignAssetsToEmployees);
                              },
                              color: selectedOption == 3
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          );
                        }),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.01,
                        // ),
                        Consumer<DashboardProvider>(builder:
                            (BuildContext context, value, Widget? child) {
                          return Consumer<DashboardProvider>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return MouseRegion(
                                opaque: true,
                                onEnter: (event) {
                                  setState(() {
                                    isHovering = 4;
                                    selectedOption = 4;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    isHovering = 0;
                                    selectedOption = 0;
                                  });
                                },
                                child: CustomDashboardContainer(
                                  title: 'Un-Assign Assets ',
                                  ontap: () {
                                    setState(() {
                                      selectedOption = 4;
                                    });
                                    Provider.of<DashboardProvider>(context,
                                            listen: false)
                                        .addPage(5);
                                    localNavigator
                                        .navigateTo(Routes.unAssignAssets);
                                  },
                                  color: selectedOption == 4
                                      ? primaryColor
                                      : Colors.grey.shade600,
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  );
                }),
                const CustomHeading(
                    title: 'Manage Assets', showBackButton: false),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Consumer<DashboardProvider>(builder:
                          (BuildContext context, value, Widget? child) {
                        return MouseRegion(
                          opaque: true,
                          onEnter: (event) {
                            setState(() {
                              isHovering = 6;
                              selectedOption = 6;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              isHovering = 0;
                              selectedOption = 0;
                            });
                          },
                          child: CustomDashboardContainer(
                              title: 'Add Assets ',
                              ontap: () {
                                setState(() {
                                  selectedOption = 6;
                                });
                                Provider.of<DashboardProvider>(context,
                                        listen: false)
                                    .addPage(3);
                                localNavigator.navigateTo(Routes.addAssets);
                              },
                              color: selectedOption == 6
                                  ? primaryColor
                                  : Colors.grey.shade600),
                        );
                      }),
                      Consumer<DashboardProvider>(builder:
                          (BuildContext context, value, Widget? child) {
                        return MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              isHovering = 7;
                              selectedOption = 7;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              isHovering = 0;
                              selectedOption = 0;
                            });
                          },
                          child: CustomDashboardContainer(
                            title: 'Delete Assets ',
                            ontap: () {
                              setState(() {
                                selectedOption = 7;
                              });
                              Provider.of<DashboardProvider>(context,
                                      listen: false)
                                  .addPage(6);
                              localNavigator.navigateTo(Routes.deleteAsset);
                            },
                            color: selectedOption == 7
                                ? primaryColor
                                : Colors.grey.shade600,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const CustomHeading(
                    title: 'Scrap Asset Details', showBackButton: false),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            isHovering = 8;
                            selectedOption = 8;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHovering = 0;
                            selectedOption = 0;
                          });
                        },
                        child: CustomDashboardContainer(
                          title: 'Scrap Assets ',
                          ontap: () {
                            setState(() {
                              selectedOption = 8;
                            });
                            localNavigator.navigateTo(Routes.scrapAssets);
                          },
                          color: selectedOption == 8
                              ? primaryColor
                              : Colors.grey.shade600,
                        ),
                      ),
                      MouseRegion(
                        opaque: true,
                        onEnter: (event) {
                          setState(() {
                            isHovering = 9;
                            selectedOption = 9;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHovering = 0;
                            selectedOption = 0;
                          });
                        },
                        child: CustomDashboardContainer(
                            title: 'Create Scrap',
                            ontap: () {
                              setState(() {
                                selectedOption = 9;
                              });
                              localNavigator.navigateTo(Routes.createScrap);
                            },
                            color: selectedOption == 9
                                ? primaryColor
                                : Colors.grey.shade600),
                      ),
                      MouseRegion(
                        opaque: true,
                        onEnter: (event) {
                          setState(() {
                            isHovering = 10;
                            selectedOption = 10;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHovering = 0;
                            selectedOption = 0;
                          });
                        },
                        child: CustomDashboardContainer(
                            title: 'Recover Scrap',
                            ontap: () {
                              setState(() {
                                selectedOption = 10;
                              });
                              localNavigator.navigateTo(Routes.scrapRecovered);
                            },
                            color: selectedOption == 10
                                ? primaryColor
                                : Colors.grey.shade600),
                      ),
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

class CustomDashboardContainer extends StatelessWidget {
  const CustomDashboardContainer({
    super.key,
    required this.title,
    required this.ontap,
    required this.color,
    this.quantity,
  });

  final Color color;
  final int? quantity;
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor),
            color: color),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.022,
                      color: Colors.white),
                ),
              ),
              if (quantity != null)
                Text(quantity?.toString() ?? '',
                    // "01 ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      color: Colors.grey.shade800,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: Navigator(
                key: NavigatorKeys.dashboardNavigator,
                initialRoute: Routes.dashboard,
                onGenerateRoute: (RouteSettings settings) {
                  switch (settings.name) {
                    case Routes.dashboard:
                      return _getPageRoute(const DashboardPage());
                    case Routes.assignedEmployees:
                      return _getPageRoute(const AssignedEmployees());
                    case Routes.unAssignedEmployees:
                      return _getPageRoute(const UnAssignedEmployees());
                    case Routes.allAsset:
                      return _getPageRoute(const AllAssetScreen());
                    case Routes.unAssignedAssets:
                      return _getPageRoute(const UnAssignedAssets());
                    case Routes.firstFloorAsset:
                      return _getPageRoute(const FirstFloorScreen());
                    case Routes.secondFloorAsset:
                      return _getPageRoute(const SecondFlorAsset());
                    case Routes.assetsStatistics:
                      return _getPageRoute(const AssetsStatistics());
                    case Routes.assignAssetsToEmployees:
                      return _getPageRoute(const AssignAssets());
                    case Routes.addAssets:
                      return _getPageRoute(const AddAssets());
                    case Routes.unAssignAssets:
                      return _getPageRoute(const UnAssignAsset());
                    case Routes.deleteAsset:
                      return _getPageRoute(const DeleteAsset());
                    case Routes.history:
                      return _getPageRoute(const HistoryScreen());
                    default:
                      return _getPageRoute(const LoginScreen());
                  }
                },
              ),
            ),
          ],
        ));
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
