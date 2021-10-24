import 'dart:ui';

import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/colors.dart';
import 'package:blurry/resources/icons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Blurry extends StatelessWidget {
  final String title;
  final String description;
  final String cancelButtonText;
  final String confirmButtonText;
  late BLURRY_TYPE? type;
  late Color? themeColor;
  final Function onConfirmButtonPressed;
  final Function? onCancelButtonPressed;
  late IconData icon;

  Blurry(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.themeColor,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed,
      required this.icon})
      : super(key: key);

  Blurry.info(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed})
      : super(key: key) {
    type = BLURRY_TYPE.info;
    icon = BlurryIcons.infoIcon;
    themeColor = null;
  }

  Blurry.success(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed})
      : super(key: key) {
    type = BLURRY_TYPE.success;
    icon = BlurryIcons.successIcon;
    themeColor = null;
  }

  Blurry.error(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed})
      : super(key: key) {
    type = BLURRY_TYPE.error;
    icon = BlurryIcons.errorIcon;
    themeColor = null;
  }

  Blurry.warning(
      {Key? key,
      required this.title,
      required this.description,
      this.cancelButtonText = 'Cancel',
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed})
      : super(key: key) {
    type = BLURRY_TYPE.warning;
    icon = BlurryIcons.warningIcon;
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
    Color renderingColor = _getRenderingColorTheme();
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
                  Icon(icon, color: renderingColor, size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onCancelButtonPressed?.call();
                  },
                  child: Text(cancelButtonText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: renderingColor)),
                ),
                GestureDetector(
                  onTap: () {
                    onConfirmButtonPressed.call();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: renderingColor.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          confirmButtonText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: renderingColor),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color _getRenderingColorTheme() {
    if (themeColor != null) {
      return themeColor!;
    } else {
      switch (type) {
        case BLURRY_TYPE.info:
          return BlurryColors.infoColor;
        case BLURRY_TYPE.success:
          return BlurryColors.successColor;
        case BLURRY_TYPE.error:
          return BlurryColors.errorColor;
        default:
          return BlurryColors.warningColor;
      }
    }
  }
}
