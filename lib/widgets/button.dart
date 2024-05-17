import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyButton extends StatelessWidget {
  final String title;
  Function() onPressed;
  MyButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4155FA),
            Color.fromARGB(255, 87, 95, 171),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 71, 83, 149).withOpacity(0.6),
            offset: const Offset(3.0, 4.0),
            blurRadius: 12.0,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MyLogoButton extends StatelessWidget {
  final String imgUrl;
  final String title;
  const MyLogoButton({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        // width: screenW * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imgUrl,
                width: 25,
              ),
              const Gap(10.0),
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
