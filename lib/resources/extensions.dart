import 'package:blurry/blurry.dart';
import 'package:blurry/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

extension BlurryTypeExtension on DEFAULT_THEMES? {
  IconData? renderingIcon(IconData? widgetIcon) =>
      this == null ? widgetIcon : themesIcons[this]!;

  Color renderingColor(Color? themeColor) {
    if (themeColor != null) {
      return themeColor;
    } else {
      switch (this) {
        case DEFAULT_THEMES.info:
          return BlurryColors.infoColor;
        case DEFAULT_THEMES.success:
          return BlurryColors.successColor;
        case DEFAULT_THEMES.error:
          return BlurryColors.errorColor;
        default:
          return BlurryColors.warningColor;
      }
    }
  }
}

extension WidgetExtension on Widget {
  Widget clickable({
    required Function onPress,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onPress.call();
      },
      child: this,
    );
  }
}

extension BlurryExtensions on Blurry {

  void initializeValuesInputBlurry({
    bool passwordField = false,
  }){
    assert(inputLabel != null && inputTextController != null);
    assert(defaultTheme != null || (themeColor != null && icon != null));
    isPasswordField = passwordField;
    items = null;
    onItemSelected = null;
  }

}
