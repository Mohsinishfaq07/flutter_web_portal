import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../app_url.dart';

  class DashboardProvider extends ChangeNotifier {
    int? assignedUserCount;
    int? unAssignedUserCount;
    int? allAssetsCount;
    int? allUnAssignedAssetsCount;
    int? firstFloorAssetsCount;
    int? secondFloorAssetsCount;
    // String? assetValue;

    bool isLoading = false;
    List<int> indexStack = [1];
    List<Map<String, dynamic>> userSearch = [];

    void performUserSearch(String query) {
      isLoading = true; // Set isLoading to true before making the request
      searchUsers(query); // Call the existing searchUsers method
    }
    // void searchCategories(String query) {
    //   isLoading = true; // Set isLoading to true before making the request
    //   chooseCategory(query,); // Call the existing searchUsers method
    // }
    String selectedAssetType = "";
    List<Map<String, dynamic>> assets = [];

    Future<void> chooseCategory(int assetType) async {
      try {
        Dio dio = Dio();
        var url = 'http://192.168.11.215:3000/asset/assetType/$assetType}';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response);
          // print(response.statusCode);
          // print(response);
          // var responseData = response.data;
          // print ('hiiiiiiiiiiii');
          // print(responseData.runtimeType); // Print the type of responseData
            assets=List<Map<String,dynamic>>.from((response.data as Map<String,dynamic>)["assets"]);
            notifyListeners();

          // print(responseData);
          // if (responseData['assets'] != null && responseData['assets'] is List) {
          //   assets =( response.data['assets'] as List<Map<String, dynamic>>);
          //   // assets = List<Map<String, dynamic>>.from(responseData['assets']); // Update assets list
          //   isLoading = false;
          } else {
            assets = [];
            isLoading = false;
          }

        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }
    Future<void> searchUsers(String query) async {
      try {
        Dio dio = Dio();
        var url = 'http://192.168.11.215:3000/user/search/$query';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['users'] != null) {
            // Assuming responseData['users'] is a list of maps
            userSearch = List<Map<String, dynamic>>.from(responseData['users']);
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    void addPage(int index) {
      if (index == indexStack.last) {
        return;
      }
      indexStack.add(index);
      notifyListeners();
    }

    void removePage() {
      Future.delayed(const Duration(milliseconds: 0), () {
        indexStack.removeLast();
        notifyListeners();
      });
    }

    Future<void> getAssignedUserCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.assignedUserCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_assigned_users'] != null) {
            assignedUserCount = responseData['total_assigned_users'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    Future<void> getUnAssignedUserCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.unAssignedUserCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_unassigned_users'] != null) {
            unAssignedUserCount = responseData['total_unassigned_users'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    Future<void> getAllAssetsCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.allAssetCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_assets'] != null) {
            allAssetsCount = responseData['total_assets'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    Future<void> getAllUnAssignedAssetsCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.unAssignedAssetCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_unassigned_assets'] != null) {
            allUnAssignedAssetsCount = responseData['total_unassigned_assets'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    Future<void> getFloorOneAssetsCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.firstFloorAssetCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_assets'] != null) {
            firstFloorAssetsCount = responseData['total_assets'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }

    Future<void> getFloorTwoAssetsCount() async {
      try {
        Dio dio = Dio();
        var url = AppUrl.baseUrl + AppUrl.secondFloorAssetCount;
        // var url = 'http://192.168.4.139:3000/asset/allAssets';
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response);
          var responseData = response.data;
          print(responseData);
          if (responseData['total_assets'] != null) {
            secondFloorAssetsCount = responseData['total_assets'];
            isLoading = false;
          } else {
            isLoading = false;
          }
        } else {
          print('API request failed with status: ${response.statusCode}');
        }
        notifyListeners();
      } catch (e) {
        print('Error fetching data: $e');
      }
    }
  }
