import 'package:blurry/resources/arrays.dart';
import 'package:flutter/material.dart';

class DefaultBlurryValues {
  static const TextStyle titleDefaultStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle descriptionDefaultStyle = TextStyle(
    fontSize: 18,
  );

  static BoxDecoration defaultBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white.withOpacity(0.85),
  );

  static const TextStyle defaultInputTextStyle = TextStyle(
    color: Colors.black,
  );

  static const defaultDisplayCancelButtonState = true;

  static const defaultDismissableValue = true;
  static const defaultVisibilityEyeValue = true;

  static const String defaultCancelButtonText = 'Cancel';

  static const LAYOUT_TYPE defaultLayoutType = LAYOUT_TYPE.ltr;
}
