import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

class BlurryPopupDescription extends StatelessWidget {
  final String description;
  final LAYOUT_TYPE layoutType;
  final TextStyle? textStyle;

  const BlurryPopupDescription({
    Key? key,
    required this.description,
    required this.layoutType,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              description,
              textAlign: layoutType == LAYOUT_TYPE.center
                  ? TextAlign.center
                  : layoutType == LAYOUT_TYPE.rtl
                      ? TextAlign.end
                      : TextAlign.start,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
