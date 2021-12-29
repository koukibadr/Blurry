import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/values.dart';
import 'package:flutter/material.dart';

import 'blurry_buttons_layout.dart';
import 'blurry_popup_description.dart';
import 'blurry_popup_title.dart';

class BlurrySingleChoiceSelector extends StatelessWidget {
  final double? popupHeight;
  final LAYOUT_TYPE layoutType;
  final Color renderingColor;
  final IconData? icon;
  final BLURRY_TYPE? blurryType;
  final String title;
  final TextStyle? titleTextStyle;
  final String description;
  final TextStyle? descriptionTextStyle;
  final String confirmButtonText;
  final String cancelButtonText;
  final TextStyle? buttonTextStyle;
  final Function onConfirmPressed;
  final Function onCancelPressed;
  final bool displayCancelButton;

  const BlurrySingleChoiceSelector({
    Key? key,
    required this.popupHeight,
    required this.blurryType,
    required this.icon,
    required this.layoutType,
    required this.renderingColor,
    required this.titleTextStyle,
    required this.title,
    required this.description,
    required this.descriptionTextStyle,
    required this.buttonTextStyle,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.displayCancelButton,
    required this.onCancelPressed,
    required this.onConfirmPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: popupHeight ?? MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: DefaultBlurryValues.defaultBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                BlurryPopupTitle(
                  layoutType: layoutType,
                  renderingColor: renderingColor,
                  icon: icon,
                  blurryType: blurryType,
                  title: title,
                  textStyle: titleTextStyle,
                ),
                BlurryPopupDescription(
                  description: description,
                  layoutType: layoutType,
                  textStyle: descriptionTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BlurryButtonsLayout(
              confirmButtonText: confirmButtonText,
              cancelButtonText: cancelButtonText,
              layoutType: layoutType,
              buttonColor: renderingColor,
              textStyle: buttonTextStyle,
              onCancelButtonPressed: onCancelPressed,
              onConfirmButtonPressed: onConfirmPressed,
              displayCancelButton: displayCancelButton,
            ),
          ),
        ],
      ),
    );
  }
}
