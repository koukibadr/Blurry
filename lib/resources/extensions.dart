import 'package:blurry/blurry.dart';
import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

extension BlurryTypeExtension on DefaultThemes? {
  IconData? renderingIcon(IconData? widgetIcon) =>
      this == null ? widgetIcon : themesIcons[this]!;

  Color renderingColor(Color? themeColor) {
    if (themeColor != null) {
      return themeColor;
    } else {
      switch (this) {
        case DefaultThemes.info:
          return BlurryColors.infoColor;
        case DefaultThemes.success:
          return BlurryColors.successColor;
        case DefaultThemes.error:
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
  }) {
    assert(inputLabel != null && inputTextController != null);
    assert(defaultTheme != null || (themeColor != null && icon != null));
    isPasswordField = passwordField;
    items = null;
    onItemSelected = null;
  }

  void initializeValuesSingleSelectorBlurry() {
    inputLabel = null;
    inputTextController = null;
    onConfirmButtonPressed = null;
    onCancelButtonPressed = null;
    displayCancelButton = true;
    assert(defaultTheme != null || (themeColor != null && icon != null));
    assert(items != null && items!.isNotEmpty);
  }

  void initializeValuesBlurryPopup() {
    icon = themesIcons[defaultTheme];
    themeColor = null;
    items = null;
    onItemSelected = null;
  }
}
