import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson38/forms/password_information.dart';
import 'package:lesson38/forms/user_information.dart';
import 'package:lesson38/pages/log_in_page.dart';
import 'package:lesson38/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool checkEye = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _secondPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
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
                    "Register",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Create your account for your schedule",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const MyTitleField(
                    icon: CupertinoIcons.person,
                    hindText: "Your name",
                  ),
                  const Gap(20.0),
                  MyEmailField(
                    icon: CupertinoIcons.mail,
                    hintText: "Your Email",
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
                  MyPasswordField(
                    checkEye: checkEye,
                    onPressed: () {
                      setState(() {
                        checkEye = !checkEye;
                      });
                    },
                    controller: _secondPasswordController,
                  ),
                  const Gap(20.0),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Did you have an account?",
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
                                  builder: (context) => const LogInPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign in here",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(100.0),
                      MyButton(
                        title: "Continue",
                        onPressed: () {
                          final enteredEmail = _emailController.text;
                          final enteredPswd = _passwordController.text;
                          final secondEneretdPswd =
                              _secondPasswordController.text;
                          if (enteredEmail.isNotEmpty &&
                              enteredPswd.isNotEmpty &&
                              secondEneretdPswd.isNotEmpty) {
                            if (enteredPswd == secondEneretdPswd) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInPage(),
                                  settings: RouteSettings(
                                    arguments: [enteredEmail, enteredPswd],
                                  ),
                                ),
                              );
                            } else {
                              _secondPasswordController.clear();
                            }
                          } else {
                            print('Email or password field is empty');
                            _emailController.clear();
                            _passwordController.clear();
                            _secondPasswordController.clear();
                          }
                        },
                      ),
                      const Gap(20.0),
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
