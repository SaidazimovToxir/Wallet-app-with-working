import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyPasswordField extends StatefulWidget {
  final bool checkEye;
  final Function() onPressed;
  final TextEditingController controller;

  MyPasswordField({
    super.key,
    required this.checkEye,
    required this.onPressed,
    required this.controller,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  // final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  bool _validatePassword(String password) {
    if (password.length < 8) return false;

    if (!RegExp(r'[A-Z]').hasMatch(password)) return false;

    if (!RegExp(r'[a-z]').hasMatch(password)) return false;

    if (!RegExp(r'\d').hasMatch(password)) return false;

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) return false;

    return true;
  }

  void _onChanged() {
    setState(() {
      if (_validatePassword(widget.controller.text)) {
        _errorMessage = null;
      } else {
        _errorMessage = "Iltimos to'g'ri parol kiriting '@3Ffhg6r'";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: !widget.checkEye,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            prefixIcon: const Icon(
              Icons.key_outlined,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                widget.checkEye ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: Colors.grey,
              ),
            ),
            hintText: "***********",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
            errorText: _errorMessage,
          ),
        ),
      ],
    );
  }
}
