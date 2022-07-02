import 'package:blurry/resources/arrays.dart';
import 'package:blurry/widgets/blurry_popup_button_text.dart';
import 'package:flutter/material.dart';

class BlurryConfirmButton extends StatelessWidget {
  final Function onPress;
  final Color buttonColor;
  final String buttonText;
  final TextStyle? textStyle;
  final LayoutType layoutType;

  const BlurryConfirmButton({
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 5,
            top: 5,
          ),
          child: BlurryPopupButtonText(
            text: buttonText,
            textColor: buttonColor,
            buttonTextStyle: textStyle,
            layoutType: layoutType,
          ),
        ),
      ),
    );
  }
}
