import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../app_theme.dart';
import '../../../app_url.dart';
import '../../../dashboard/presentation/widgets/routes.dart';

class AuthProvider extends ChangeNotifier {
  String _userName = 'Mohsin';
  String get userName => _userName;
  set userName(String name) {
    _userName = name;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController assetIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    String url = AppUrl.baseUrl + AppUrl.login;
    print(url);
    var data = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };
    var bodyy = json.encode(data);
    var urlParse = Uri.parse(url);
    print(data);

    try {
      http.Response response = await http.post(urlParse,
          body: bodyy, headers: {"Content-Type": "application/json"});
      print(Response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.statusCode);
        // Successful response
        var responseData = json.decode(response.body);
        print(responseData);
        userName = responseData['Name'];
        // Process the responseData here...
        print(response.statusCode);

        print('Login successful!');
        print('Response data: $responseData');

        final snackBar = SnackBar(
          content:  Text(
            "Successfully logged in as ${userName}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor:
              AppTheme.primaryColor, // Customize the background color
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.pushReplacementNamed(context, Routes.adminPage);
      } else {
        // Error handling for failed response status code
        print('Request failed with status: ${response.statusCode}');
        // Show appropriate message to the user
        if (response.statusCode == 404) {
          final snackBar = SnackBar(
            content: const Text(
              "invalid credentials",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor:
                AppTheme.primaryColor, // Customize the background color
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(data);

          // Unauthorized, invalid credentials
          print('Invalid credentials. Please try again.');
        }
        else if (response.statusCode == 401){
          final snackBar = const SnackBar(
            content: Text(
              "invalid credentials",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor:Colors.red, // Customize the background color
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(data);

          // Unauthorized, invalid credentials
          print('Invalid credentials. Please try again.');

        }

        else {
          // Handle other error scenarios...
          print('Something went wrong. Please try again later.');
        }
      }
    } catch (e) {
      // Error handling for network issues or other exceptions
      print('Error: $e');
      print('Network error. Please check your internet connection.');
    }

    notifyListeners();
  }
}
