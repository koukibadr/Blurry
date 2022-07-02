import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

import 'blurry_popup_button_text.dart';

class BlurryCancelWidget extends StatelessWidget {
  final Function onPress;
  final Color buttonColor;
  final String buttonText;
  final TextStyle? textStyle;
  final LayoutType layoutType;

  const BlurryCancelWidget({
    Key? key,
    required this.onPress,
    required this.buttonText,
    required this.layoutType,
    required this.buttonColor,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress.call();
      },
      child: BlurryPopupButtonText(
        text: buttonText,
        textColor: buttonColor,
        buttonTextStyle: textStyle,
        layoutType: layoutType,
      ),
    );
  }
}
