import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/continue_button.dart';
import '../../../app_assets.dart';
import '../../../app_url.dart';
import '../../../colors.dart';
import '../../../custom_text_form_field.dart';
import '../../../dashboard/presentation/pages/responsive.dart';
import '../../../dashboard/presentation/widgets/routes.dart';
import 'package:http/http.dart' as http;
import '../../../text_dec.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // static final GlobalKey<FormState> _loginScreenFormKey =
  //     GlobalKey<FormState>();
  // final TextEditingController loginEmailController = TextEditingController();
  // final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider.value(value: authProvider,child:
    Size _size = MediaQuery.of(context).size;
    return Responsive(
      webView: LoginWeb(
          size: _size,
          loginFormKey: _loginFormKey,
          emailController: emailController,
          passwordController: passwordController),
      tabView: LoginWeb(
          size: _size,
          loginFormKey: _loginFormKey,
          emailController: emailController,
          passwordController: passwordController),
      mobileView: LoginMobileScreen(
        loginEmailController: emailController,
        loginPasswordController: passwordController,
        loginScreenFormKey: _loginFormKey,
      ),
    );
  }
}

class LoginWeb extends StatelessWidget {
  const LoginWeb({
    super.key,
    required Size size,
    required GlobalKey<FormState> loginFormKey,
    required this.emailController,
    required this.passwordController,
  })  : _size = size,
        _loginFormKey = loginFormKey;

  final Size _size;
  final GlobalKey<FormState> _loginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  void loginUser(context) async {
    String url = AppUrl.baseUrl + AppUrl.login;

    // var url = "http://192.168.4.139:3000/api/admin/login";
    var data = {
      "email": emailController.text,
      "password": passwordController.text
    };
    var bodyy = json.encode(data);
    var urlParse = Uri.parse(url);

    try {
      // Dio dio = Dio();
      http.Response response = await http.post(urlParse,
          body: bodyy, headers: {"Content-Type": "application/json"});
      //  var response = await dio.post(url, data: bodyy, options: Options(
      //      method: "post",
      //      contentType: "application/json",responseType: ResponseType.json));

      if (response.statusCode == 200) {
        // Successful response
        var responseData = json.decode(response.body);
        // Process the responseData here...
        print(response.statusCode);
        print('Login successful!');
        print('Response data: $responseData');
        Navigator.pushReplacementNamed(context, Routes.adminPage);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textDesc(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 12,
                  ),
                  child: Container(
                    height: _size.width > 200 ? 480 : 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello, Admin",
                            style: TextStyle(
                              fontSize: 50,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Please Login Your Account",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Form(
                              key: _loginFormKey,
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      suffixIcon: Icon(
                                        Icons.alternate_email,
                                        color: AppTheme.primaryColor,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter an email';
                                      }
                                      // You can add more validation logic here
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      hintText: "password",
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: AppTheme.primaryColor,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outline_rounded,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                      // You can add more validation logic here
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  ContinueButton(
                                    text: "Login",
                                    ontap: () {

                                      // Navigator.pushReplacementNamed(context, Routes.adminPage);
                                      if (_loginFormKey.currentState!
                                          .validate()) {
                                        loginUser(context);
                                       }
                                      // Navigator.pushReplacementNamed(context, Routes.adminPage);

                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //  ),
    );
  }
}

class LoginMobileScreen extends StatelessWidget {
  const LoginMobileScreen({
    required GlobalKey<FormState> loginScreenFormKey,
    required this.loginEmailController,
    required this.loginPasswordController,
  }) : _loginScreenFormKey = loginScreenFormKey;

  final GlobalKey<FormState> _loginScreenFormKey;
  final TextEditingController loginEmailController;
  final TextEditingController loginPasswordController;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

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
                  padding: const EdgeInsets.only(top: 22, bottom: 25),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Image.asset(
                        AppAssets.aislogo,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      )),
                ),
                Text(
                  'Welcome Back!',
                  style: AppTheme.heading1
                      .copyWith(color: AppTheme.primaryColor, fontSize: 25),
                ),
                Text(
                  'Please login to your account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: _size.width > 1200
                        ? 260
                        : _size.width > 1000
                            ? 240
                            : _size.width > 900
                                ? 220
                                : _size.width > 800
                                    ? 200
                                    : _size.width > 750
                                        ? 180
                                        : _size.width > 700
                                            ? 160
                                            : _size.width > 650
                                                ? 140
                                                : 0,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Form(
                    key: _loginScreenFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          allowNumbersOnly: false,
                          textInputAction: TextInputAction.next,
                          width: double.infinity,
                          hintText: "Email",
                          onChanged: (value) {},
                          suffixIcon: Icon(
                            Icons.alternate_email,
                            color: AppTheme.primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppTheme.primaryColor,
                          ),
                          controller: loginEmailController,
                          validator: (value) {},
                        ),
                        const SizedBox(height: 28),
                        CustomTextFormField(
                          allowNumbersOnly: false,
                          textInputAction: TextInputAction.done,
                          width: double.infinity,
                          hintText: "Password",
                          onChanged: (value) {},
                          isPassword: true,
                          obsecure: true,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppTheme.primaryColor,
                          ),
                          controller: loginPasswordController,
                          validator: (value) {},
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 45),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                ContinueButton(
                  text: "Login",
                  ontap: () {
                    // String username = loginEmailController.text;
                    debugPrint('on tapped');
                    Navigator.pushReplacementNamed(context, Routes.adminPage);

                    // authController.login(loginEmailController.text,
                    //     loginPasswordController.text);
                    // String username = loginEmailController.text;
                    // authController.login(username, loginPasswordController.text
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
