import 'package:blurry/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

import 'colors.dart';

extension BlurryTypeExtension on BLURRY_TYPE? {
  IconData? renderingIcon(IconData? widgetIcon) =>
      this == null ? widgetIcon : themesIcons[this]!;

  Color renderingColor(Color? themeColor) {
    if (themeColor != null) {
      return themeColor;
    } else {
      switch (this) {
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
