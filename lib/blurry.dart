import 'dart:ui';

import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/colors.dart';
import 'package:blurry/resources/icons.dart';
import 'package:blurry/resources/values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Blurry extends StatelessWidget {
  ///default constructor
  ///to generate customized blurry dialog
  Blurry(
      {Key? key,
      required this.title,
      required this.description,
      required this.themeColor,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      required this.icon,
      this.cancelButtonText = 'Cancel',
      this.onCancelButtonPressed,
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor})
      : super(key: key);

  ///info constructor to render info style dialog
  Blurry.info(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor})
      : super(key: key) {
    type = BLURRY_TYPE.info;
    icon = BlurryIcons.infoIcon;
    themeColor = null;
  }

  ///render success style dialog
  Blurry.success(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor})
      : super(key: key) {
    type = BLURRY_TYPE.success;
    icon = BlurryIcons.successIcon;
    themeColor = null;
  }

  ///render error style dialog
  Blurry.error(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor})
      : super(key: key) {
    type = BLURRY_TYPE.error;
    icon = BlurryIcons.errorIcon;
    themeColor = null;
  }

  ///render warning style dialog
  Blurry.warning(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor})
      : super(key: key) {
    type = BLURRY_TYPE.warning;
    icon = BlurryIcons.warningIcon;
    themeColor = null;
  }

  ///the dialog popup title, required in all blurry class constructors
  final String title;

  ///the dialog description text
  ///required in all blurry class constructors
  final String description;

  ///the cancel button text, by default  it's 'Cancel'
  final String cancelButtonText;

  ///the confirm button (primary button) text string
  final String confirmButtonText;

  ///the dialog theme color
  ///will be applied on buttons and icon
  ///not available in default types constructors (info, error, warning, success)
  late Color? themeColor;

  ///function invoked when the primary button is pressed
  ///required in all constructors
  final Function onConfirmButtonPressed;

  ///the callback that will be invoked when pressing on cancel button
  final Function? onCancelButtonPressed;

  ///the icon that will be rendered in the dialog
  ///required only when using the default constructor
  late IconData icon;

  ///title text style, by default it's null
  final TextStyle? titleTextStyle;

  ///description text style, by default it's null
  final TextStyle? descriptionTextStyle;

  ///button text style, by default it's null
  final TextStyle? buttonTextStyle;

  ///the blurry dialog popup height
  final double? popupHeight;

  ///indicate whether the cancel button will be rendered or not
  ///by default the cancel button is displayed
  final bool displayCancelButton;

  ///indicates whether the popup dialog is dismissable or not
  ///by default [dismissable = true]
  final bool dismissable;

  ///the color of the barrier of the burry dialog
  ///if it's null the barrier color will be the default color [Colors.black54]
  final Color? barrierColor;

  late BLURRY_TYPE? type;

  ///display the rendered dialog content
  ///in alert dialog
  ///
  ///[context]: the context of the app to display the dialog
  void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: dismissable,
        barrierColor: barrierColor ?? BlurryColors.defaultBarrierColor,
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
      height: popupHeight ?? MediaQuery.of(context).size.height * 0.25,
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
                      style: titleTextStyle ??
                          DefaultBlurryValues.titleDefaultStyle)
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      description,
                      style: descriptionTextStyle ??
                          DefaultBlurryValues.descriptionDefaultStyle,
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (displayCancelButton)
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onCancelButtonPressed?.call();
                    },
                    child: _renderButtonText(cancelButtonText, renderingColor),
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
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 5),
                        child: _renderButtonText(
                            confirmButtonText, renderingColor),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text _renderButtonText(String text, Color textColor) {
    return Text(text,
        style: buttonTextStyle == null
            ? TextStyle(fontWeight: FontWeight.bold, color: textColor)
            : buttonTextStyle!
                .copyWith(color: textColor, fontWeight: FontWeight.bold));
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
