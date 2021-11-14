import 'dart:ui';

import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/colors.dart';
import 'package:blurry/resources/values.dart';
import 'package:blurry/widgets/blurry_buttons_layout.dart';
import 'package:blurry/widgets/blurry_cancel_widget.dart';
import 'package:blurry/widgets/blurry_confirm_button.dart';
import 'package:blurry/widgets/blurry_info_popup.dart';
import 'package:blurry/widgets/blurry_input_popup.dart';
import 'package:blurry/widgets/blurry_popup_button_text.dart';
import 'package:blurry/widgets/blurry_popup_title.dart';
import 'package:blurry/widgets/blurry_text_field.dart';
import 'package:flutter/material.dart';
import 'package:blurry/resources/extensions.dart';

import 'widgets/blurry_popup_description.dart';

// ignore: must_be_immutable
class Blurry extends StatefulWidget {
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
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    _dialogType = TYPE.info;
    type = null;
  }

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
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.info;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
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
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.success;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
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
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.error;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
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
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.warning;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
  }

  Blurry.input(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      required this.inputLabel,
      required this.inputTextController,
      this.themeColor,
      this.type,
      this.icon,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black),
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr})
      : super(key: key) {
    _dialogType = TYPE.input;
    assert(inputLabel != null && inputTextController != null);
    assert(type != null || themeColor != null);
    if (type != null && themeColor != null) {
      throw Exception('only dialogType or themeColor should be provided');
    }
    if (type == null) {
      assert(icon != null);
    }
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
  late IconData? icon;

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

  //TODO add documentation
  final LAYOUT_TYPE layoutType;

  //TODO add documentation
  late String? inputLabel;

  //TODO add documentation
  late TextEditingController? inputTextController;

  //TODO add documentation
  late TextStyle inputTextStyle;

  //TODO add documentation
  late TextStyle inputLabelStyle;

  //? private values
  late BLURRY_TYPE? type;

  late TYPE? _dialogType;

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
      },
    );
  }

  @override
  State<Blurry> createState() => _BlurryState();
}

class _BlurryState extends State<Blurry> {
  @override
  Widget build(BuildContext context) {
    return widget._dialogType == TYPE.info
        ? BlurryInfoPopup(
            popupHeight: widget.popupHeight,
            blurryType: widget.type,
            icon: widget.icon,
            layoutType: widget.layoutType,
            renderingColor: widget.type.renderingColor(widget.themeColor),
            titleTextStyle: widget.titleTextStyle,
            title: widget.title,
            description: widget.description,
            descriptionTextStyle: widget.descriptionTextStyle,
            buttonTextStyle: widget.buttonTextStyle,
            cancelButtonText: widget.cancelButtonText,
            confirmButtonText: widget.confirmButtonText,
            displayCancelButton: widget.displayCancelButton,
            onCancelPressed: () {
              Navigator.pop(context);
              widget.onCancelButtonPressed?.call();
            },
            onConfirmPressed: () {
              widget.onConfirmButtonPressed.call();
            },
          )
        : BlurryInputPopup(
            popupHeight: widget.popupHeight,
            blurryType: widget.type,
            icon: widget.icon,
            layoutType: widget.layoutType,
            renderingColor: widget.type.renderingColor(widget.themeColor),
            titleTextStyle: widget.titleTextStyle,
            title: widget.title,
            description: widget.description,
            descriptionTextStyle: widget.descriptionTextStyle,
            inputLabel: widget.inputLabel!,
            inputLabelStyle: widget.inputLabelStyle,
            inputTextStyle: widget.inputTextStyle,
            textEditingController: widget.inputTextController!,
            buttonTextStyle: widget.buttonTextStyle,
            cancelButtonText: widget.cancelButtonText,
            confirmButtonText: widget.confirmButtonText,
            displayCancelButton: widget.displayCancelButton,
            onCancelPressed: () {
              Navigator.pop(context);
              widget.onCancelButtonPressed?.call();
            },
            onConfirmPressed: () {
              widget.onConfirmButtonPressed.call();
            },
          );
  }
}
