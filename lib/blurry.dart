import 'dart:ui';

import 'package:flutter/material.dart';

class Blurry extends StatelessWidget {
  final String title;
  final String description;
  final String cancelButtonText;
  final String confirmButtonText;

  const Blurry(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText})
      : super(key: key);

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
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (const Color(0xFFFFFFFF)).withOpacity(0.85)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(description),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.all(8.0),
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
