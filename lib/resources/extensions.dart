import 'package:blurry/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

extension BlurryTypeExtension on BLURRY_TYPE? {
  IconData? renderingIcon(IconData? widgetIcon) =>
      this == null ? widgetIcon : themesIcons[this]!;
}
