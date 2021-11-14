import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:blurry/resources/extensions.dart';

class BlurryPopupTitle extends StatelessWidget {
  final LAYOUT_TYPE layoutType;
  final Color renderingColor;
  final IconData? icon;
  final BLURRY_TYPE? blurryType;
  final String title;
  final TextStyle? textStyle;

  const BlurryPopupTitle({
    Key? key,
    required this.layoutType,
    required this.renderingColor,
    required this.icon,
    required this.blurryType,
    required this.title,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleContent;
    if (layoutType == LAYOUT_TYPE.center) {
      titleContent = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              blurryType.renderingIcon(icon),
              color: renderingColor,
              size: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: textStyle ?? DefaultBlurryValues.titleDefaultStyle,
            )
          ],
        ),
      );
    } else if (layoutType == LAYOUT_TYPE.rtl) {
      titleContent = Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: textStyle ?? DefaultBlurryValues.titleDefaultStyle,
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              blurryType.renderingIcon(icon),
              color: renderingColor,
              size: 25,
            )
          ],
        ),
      );
    }
    titleContent = Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Icon(
            blurryType.renderingIcon(icon),
            color: renderingColor,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: textStyle ?? DefaultBlurryValues.titleDefaultStyle,
          )
        ],
      ),
    );
    return Expanded(
      flex: 1,
      child: titleContent,
    );
  }
}
