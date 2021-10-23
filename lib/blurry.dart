import 'dart:ui';

import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Blurry extends StatelessWidget {
  
  final String title;
  final String description;
  final String cancelButtonText;
  final String confirmButtonText;
  late BLURRY_TYPE? type;
  late Color? themeColor;

  Blurry(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.themeColor,
      required this.confirmButtonText})
      : super(key: key);

  Blurry.info(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText})
      : super(key: key) {
    type = BLURRY_TYPE.info;
    themeColor = null;
  }

  Blurry.success(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText})
      : super(key: key) {
    type = BLURRY_TYPE.success;
    themeColor = null;
  }

  Blurry.error(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText})
      : super(key: key) {
    type = BLURRY_TYPE.error;
    themeColor = null;
  }

  Blurry.warning(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText})
      : super(key: key) {
    type = BLURRY_TYPE.warning;
    themeColor = null;
  }

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
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.85)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Color(0xff70B8FF)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(description),
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(cancelButtonText,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff70B8FF))),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff70B8FF).withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        confirmButtonText,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff70B8FF)),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
