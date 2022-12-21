import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter_amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/auth/services/auth_service.dart';

enum AuthMode { login, signup }

class AuthScreen extends StatefulWidget {
  // here we are defining the route name for the AuthScreen
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _authMode = AuthMode.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    // to avoid memory leaks
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      name: _namecontroller.text,
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        // SafeArea widget helps to maintain the text to be below notificaiton bar
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Again!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: _authMode == AuthMode.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: AuthMode.signup,
                  groupValue: _authMode,
                  onChanged: (AuthMode? value) {
                    setState(() {
                      _authMode = value!;
                    });
                  },
                ),
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_authMode == AuthMode.signup)
                Container(
                  padding: const EdgeInsets.all(10),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _namecontroller,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                            text: 'Sign Up',
                            onTap: () {
                              if (_signupFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _authMode == AuthMode.login
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: AuthMode.login,
                  groupValue: _authMode,
                  onChanged: (AuthMode? value) {
                    setState(() {
                      _authMode = value!;
                    });
                  },
                ),
                title: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_authMode == AuthMode.login)
                Container(
                  padding: const EdgeInsets.all(10),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailcontroller,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordcontroller,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                            text: 'Login',
                            onTap: () {
                              if (_loginFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            })
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
