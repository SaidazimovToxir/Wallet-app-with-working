import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson38/forms/password_information.dart';
import 'package:lesson38/forms/user_information.dart';
import 'package:lesson38/pages/register_page.dart';
import 'package:lesson38/widgets/button.dart';
import 'package:lesson38/widgets/dialog_box.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkEye = false;
  bool checkRegister = false;
  String checkPassword = '';
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Let's login to Connect oyur email",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  MyEmailField(
                    icon: CupertinoIcons.mail_solid,
                    hintText: "name@example.com",
                    controller: _emailController,
                  ),
                  const Gap(20.0),
                  MyPasswordField(
                    checkEye: checkEye,
                    onPressed: () {
                      setState(() {
                        checkEye = !checkEye;
                      });
                    },
                    controller: _passwordController,
                  ),
                  const Gap(20.0),
                  const Text(
                    "Forget your Password ?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Did you have an account ?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(250.0),
                      MyButton(
                        title: "Log in",
                        onPressed: () async {
                          final logInEmail = _emailController.text;
                          final logInPassword = _passwordController.text;
                          final List<dynamic>? arguments =
                              ModalRoute.of(context)?.settings.arguments
                                  as List<dynamic>?;

                          if (logInEmail.isNotEmpty &&
                              logInPassword.isNotEmpty) {
                            if (arguments != null) {
                              if (logInEmail == arguments[0] &&
                                  logInPassword == arguments[1]) {
                                MyDialog.showAccountActivated(context);
                              } else {
                                MyDialog.showAccountNoActivated(context);
                              }
                            } else {
                              MyDialog.showAccountNoActivated(context);
                            }
                          } else {
                            _emailController.clear();
                            _passwordController.clear();
                          }
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyLogoButton(
                              imgUrl:
                                  "https://cdn-icons-png.flaticon.com/128/0/747.png",
                              title: "Apple",
                            ),
                            Gap(20.0),
                            MyLogoButton(
                              imgUrl:
                                  "https://cdn-icons-png.flaticon.com/128/300/300221.png",
                              title: "Google",
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "By continuing you agree to loana's",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Terms of Use",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "&",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
