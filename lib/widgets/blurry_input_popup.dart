import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'blurry_buttons_layout.dart';
import 'blurry_popup_description.dart';
import 'blurry_popup_title.dart';
import 'blurry_text_field.dart';

class BlurryInputPopup extends StatelessWidget {
  final double? popupHeight;
  final LayoutType layoutType;
  final Color renderingColor;
  final IconData? icon;
  final DefaultThemes? blurryType;
  final String title;
  final TextStyle? titleTextStyle;
  final String description;
  final TextStyle? descriptionTextStyle;
  final String inputLabel;
  final TextEditingController textEditingController;
  final TextStyle inputLabelStyle;
  final TextStyle inputTextStyle;
  final String confirmButtonText;
  final String cancelButtonText;
  final TextStyle? buttonTextStyle;
  final Function onConfirmPressed;
  final Function onCancelPressed;
  final bool displayCancelButton;
  final TextInputType textInputType;
  final bool isPassword;
  final bool withVisibityEye;

  const BlurryInputPopup({
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
    required this.inputLabel,
    required this.inputLabelStyle,
    required this.inputTextStyle,
    required this.textEditingController,
    required this.buttonTextStyle,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.displayCancelButton,
    required this.onCancelPressed,
    required this.onConfirmPressed,
    required this.textInputType,
    required this.isPassword,
    required this.withVisibityEye,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: popupHeight ?? MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.85),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(
            height: 5,
          ),
          BlurryTextField(
            label: inputLabel,
            textController: textEditingController,
            labelStyle: inputLabelStyle,
            textStyle: inputTextStyle,
            themeColor: renderingColor,
            textInputType: textInputType,
            isPassword: isPassword,
            withVisibilityEye: withVisibityEye,
          ),
          const SizedBox(
            height: 5,
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
          )
        ],
      ),
    );
  }
}
