import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

class BlurryPopupButtonText extends StatelessWidget {
  final String text;
  final Color textColor;
  final TextStyle? buttonTextStyle;
  final LayoutType layoutType;

  const BlurryPopupButtonText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.buttonTextStyle,
    required this.layoutType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: buttonTextStyle == null
          ? TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            )
          : buttonTextStyle!.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      textAlign: layoutType == LayoutType.center
          ? TextAlign.center
          : layoutType == LayoutType.rtl
              ? TextAlign.end
              : TextAlign.start,
    );
  }
}
