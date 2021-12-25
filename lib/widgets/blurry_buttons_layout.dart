import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

import 'blurry_cancel_widget.dart';
import 'blurry_confirm_button.dart';

class BlurryButtonsLayout extends StatelessWidget {
  final Color buttonColor;
  final String confirmButtonText;
  final String cancelButtonText;
  final TextStyle? textStyle;
  final LAYOUT_TYPE layoutType;
  final Function onConfirmButtonPressed;
  final Function onCancelButtonPressed;
  final bool displayCancelButton;

  const BlurryButtonsLayout({
    Key? key,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.layoutType,
    required this.buttonColor,
    required this.textStyle,
    required this.onCancelButtonPressed,
    required this.onConfirmButtonPressed,
    required this.displayCancelButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (layoutType == LAYOUT_TYPE.rtl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlurryConfirmButton(
            onPress: () {
              onConfirmButtonPressed.call();
            },
            buttonText: confirmButtonText,
            layoutType: layoutType,
            buttonColor: buttonColor,
            textStyle: textStyle,
          ),
          if (displayCancelButton)
            BlurryCancelWidget(
              onPress: () {
                onCancelButtonPressed.call();
              },
              layoutType: layoutType,
              buttonColor: buttonColor,
              textStyle: textStyle,
              buttonText: cancelButtonText,
            ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (displayCancelButton)
          BlurryCancelWidget(
            onPress: () {
              onCancelButtonPressed.call();
            },
            layoutType: layoutType,
            buttonColor: buttonColor,
            textStyle: textStyle,
            buttonText: cancelButtonText,
          ),
        BlurryConfirmButton(
          onPress: () {
            onConfirmButtonPressed.call();
          },
          buttonText: confirmButtonText,
          layoutType: layoutType,
          buttonColor: buttonColor,
          textStyle: textStyle,
        ),
      ],
    );
  }
}
