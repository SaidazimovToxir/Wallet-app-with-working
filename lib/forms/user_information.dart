import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEmailField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const MyEmailField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  @override
  State<MyEmailField> createState() => _MyEmailFieldState();
}

class _MyEmailFieldState extends State<MyEmailField> {
  String? _errorMessage;

  bool _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _onChanged() {
    setState(() {
      if (_validateEmail(widget.controller.text)) {
        _errorMessage = null;
      } else {
        _errorMessage = "Iltimos to'g'ri email address kiriting.";
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
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        errorText: _errorMessage,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}


class MyTitleField extends StatefulWidget {
  final IconData icon;
  final String hindText;
  const MyTitleField({
    super.key,
    required this.icon,
    required this.hindText,
  });

  @override
  State<MyTitleField> createState() => _MyTitleFieldState();
}

class _MyTitleFieldState extends State<MyTitleField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        hintText: widget.hindText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
