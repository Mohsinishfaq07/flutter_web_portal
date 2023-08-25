import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_portal/app_theme.dart';
import 'package:web_portal/continue_button.dart';
import '../../../app_assets.dart';
import '../../../colors.dart';
import '../../../custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import '../../../dashboard/presentation/widgets/routes.dart';
import '../../../text_dec.dart';
import '../manager/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _webLoginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _tabLoginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobileLoginFormKey = GlobalKey<FormState>();

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
              return LoginMobile(
                loginFormKey: _mobileLoginFormKey,
                emailController: emailController,
                passwordController: passwordController,
                authProvider: authProvider,
              );
            } else if (sizingInformation.isTablet) {
              return LoginTab(
                size: size,
                loginFormKey: _tabLoginFormKey,
                emailController: emailController,
                passwordController: passwordController,
                authProvider: authProvider,
              );
            } else {
              return LoginWeb(
                size: size,
                loginFormKey: _webLoginFormKey,
                emailController: emailController,
                passwordController: passwordController,
                authProvider: authProvider,
              );
            }
          },
        ),
      ),
    );
  }
}

class LoginWeb extends StatefulWidget {
  const LoginWeb({
    super.key,
    required Size size,
    required GlobalKey<FormState> loginFormKey,
    required this.emailController,
    required this.passwordController,
    required AuthProvider authProvider,
  }) : _webLoginFormKey = loginFormKey;

  final GlobalKey<FormState> _webLoginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  AuthProvider authProvider = AuthProvider();
  String _userName = 'not getting';
  String get userName => _userName;
  set userName(String name) {
    _userName = name;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textDesc(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 8,
                        ),
                        child: Container(
                          // height: widget._size.width > 1000 ? 600 : 800,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade600,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade700),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Welcome Back",
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Please Login Your Account",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Form(
                                    key: widget._webLoginFormKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomTextFormField(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              hintText: "Your Email",
                                              controller:
                                                  authProvider.emailController,
                                              allowNumbersOnly: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter an email';
                                                }
                                                // You can add more validation logic here
                                                return null;
                                              },
                                              suffixIcon: Icon(
                                                Icons.alternate_email,
                                                color: AppTheme.primaryColor,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                color: AppTheme.primaryColor,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextFormField(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              isPassword: true,
                                              hintText: "Your Password",
                                              controller: authProvider
                                                  .passwordController,
                                              allowNumbersOnly: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter Your Password';
                                                }
                                                // You can add more validation logic here
                                                return null;
                                              },
                                              suffixIcon: Icon(
                                                Icons.alternate_email,
                                                color: AppTheme.primaryColor,
                                              ),
                                              prefixIcon: Icon(
                                                Icons.lock_outline_rounded,
                                                color: AppTheme.primaryColor,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            const SizedBox(height: 20),
                                            ContinueButton(
                                              width: 300,
                                              text: "Login",
                                              ontap: () async {

                                                print("butoon clicked ");
                                                if (widget._webLoginFormKey
                                                    .currentState!
                                                    .validate()) {
                                                  final authProvider =
                                                      Provider.of<AuthProvider>(
                                                          context,
                                                          listen: false);
                                                  await authProvider.loginUser(
                                                      context,
                                                      widget
                                                          .emailController.text.trim(),
                                                      widget.passwordController
                                                          .text);
                                                  print("if is working ");


                                                }
                                              },

                                              // Navigator.pushReplacementNamed(context, Routes.adminPage);
                                            ),
                                            // ContinueButton(
                                            //   width: 300,
                                            //   text: "Login",
                                            //   ontap: () async {
                                            //     if (widget._webLoginFormKey.currentState!.validate()) {
                                            //       final authProvider = Provider.of<AuthProvider>(context, listen: false);
                                            //       final   loginResult = await authProvider.loginUser(
                                            //         context,
                                            //         widget.emailController.text,
                                            //         widget.passwordController.text,
                                            //       );
                                            //
                                            //       if (loginResult) {
                                            //         final snackBar = SnackBar(
                                            //           content: Text(
                                            //             "Successfully logged in as ${authProvider.userName}",
                                            //             style: const TextStyle(
                                            //               color: Colors.blue,
                                            //               fontWeight: FontWeight.bold,
                                            //             ),
                                            //           ),
                                            //           backgroundColor: AppTheme.primaryColor,
                                            //         );
                                            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            //       } else {
                                            //         const snackBar = SnackBar(
                                            //           content: Text(
                                            //             "Login unsuccessful. Please check your credentials.",
                                            //             style: TextStyle(
                                            //               color: Colors.red,
                                            //               fontWeight: FontWeight.bold,
                                            //             ),
                                            //           ),
                                            //           backgroundColor: Colors.black87,
                                            //         );
                                            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            //       }
                                            //     }
                                            //   },
                                            // )

                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      //  ),
    );
  }
}

class LoginTab extends StatefulWidget {
  const LoginTab({
    super.key,
    required Size size,
    required GlobalKey<FormState> loginFormKey,
    required this.emailController,
    required this.passwordController,
    required AuthProvider authProvider,
  })  : _size = size,
        _tabLoginFormKey = loginFormKey;

  final Size _size;
  final GlobalKey<FormState> _tabLoginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  String responseMessage = 'empty';

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 5),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
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
              const Text(
                'Please login to your account',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: widget._tabLoginFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
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
                        controller: authProvider.emailController,
                        allowNumbersOnly: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Your Email';
                          }
                          // You can add more validation logic here
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        width: double.infinity,
                        hintText: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Your Password';
                          }
                          // You can add more validation logic here
                          return null;
                        },
                        isPassword: true,
                        obsecure: true,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: AppTheme.primaryColor,
                        ),
                        controller: authProvider.passwordController,
                        allowNumbersOnly: false,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (widget._tabLoginFormKey.currentState!.validate()) {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);
                    await authProvider.loginUser(
                        context,
                        widget.emailController.text,
                        widget.passwordController.text);

                    final snackBar = SnackBar(
                      content: Text(
                        "Successfully logged in as ${authProvider.userName}",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppTheme
                          .primaryColor, // Customize the background color
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 50,
                    decoration: AppTheme.roundedContainerDecoration
                        .copyWith(color: AppTheme.primaryColor),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: FontWeight.bold),
                      ),
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

class LoginMobile extends StatefulWidget {
  const LoginMobile({
    super.key,
    required GlobalKey<FormState> loginFormKey,
    required this.emailController,
    required this.passwordController,
    required AuthProvider authProvider,
  }) : _mobileLoginFormKey = loginFormKey;

  final GlobalKey<FormState> _mobileLoginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
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
                Text(
                  'Welcome Back!',
                  style: AppTheme.heading1
                      .copyWith(color: AppTheme.primaryColor, fontSize: 25),
                ),
                const Text(
                  'Please login to your account',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: widget._mobileLoginFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
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
                          controller: authProvider.emailController,
                          allowNumbersOnly: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Email';
                            }
                            // You can add more validation logic here
                            return null;
                          },
                        ),
                        const SizedBox(height: 28),
                        CustomTextFormField(
                          textInputAction: TextInputAction.done,
                          width: double.infinity,
                          hintText: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Password';
                            }
                            // You can add more validation logic here
                            return null;
                          },
                          isPassword: true,
                          obsecure: true,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppTheme.primaryColor,
                          ),
                          controller: authProvider.passwordController,
                          allowNumbersOnly: false,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (widget._mobileLoginFormKey.currentState!.validate()) {
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      await authProvider.loginUser(
                          context,
                          widget.emailController.text,
                          widget.passwordController.text);

                      final snackBar = SnackBar(
                        content: Text(
                          "Successfully logged in as ${authProvider.userName}",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: AppTheme
                            .primaryColor, // Customize the background color
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    // Navigator.pushReplacementNamed(context, Routes.adminPage);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      height: 50,
                      decoration: AppTheme.roundedContainerDecoration
                          .copyWith(color: AppTheme.primaryColor),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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

class ThemeModel {
  final ValueNotifier<bool> isDarkTheme = ValueNotifier(false);

  Color getTextColor({bool inverted = false}) {
    return isDarkTheme.value
        ? (inverted ? Colors.blue : Colors.red)
        : (inverted ? Colors.blue : Colors.red);
  }

  Color getBackgroundColor({bool inverted = false}) {
    return isDarkTheme.value
        ? (inverted ? Colors.blue : Colors.red)
        : (inverted ? Colors.blue : Colors.red);
  }

  Color getIconColor({bool inverted = false}) {
    return isDarkTheme.value
        ? (inverted ? Colors.blue : Colors.red)
        : (inverted ? Colors.blue : Colors.red);
  }

  Color getLeftSideBarColor({bool inverted = false}) {
    return isDarkTheme.value
        ? (inverted ? Colors.blue : Colors.red)
        : (inverted ? Colors.blue : Colors.red);
  }

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}

class ThemeProvider extends ChangeNotifier {
  final ThemeModel _themeModel = ThemeModel();

  bool get isDarkTheme => _themeModel.isDarkTheme.value;

  void toggleTheme() {
    _themeModel.toggleTheme();
    notifyListeners();
  }
}
