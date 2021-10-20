import 'dart:ui';

import 'package:flutter/material.dart';

class Blurry extends StatelessWidget {
  const Blurry({Key? key}) : super(key: key);

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: this,
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.white.withOpacity(0),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (const Color(0xFFDFDFDF)).withOpacity(0.85)),
    );
  }
}
