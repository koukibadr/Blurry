import 'package:flutter/cupertino.dart';

import 'icons.dart';

enum DefaultThemes {
  info,
  success,
  error,
  warning,
}

enum LayoutType {
  ltr,
  rtl,
  center,
}

enum TYPE {
  info,
  input,
  singleChoiceSelector,
}

Map<DefaultThemes, IconData> themesIcons = {
  DefaultThemes.info: BlurryIcons.infoIcon,
  DefaultThemes.error: BlurryIcons.errorIcon,
  DefaultThemes.success: BlurryIcons.successIcon,
  DefaultThemes.warning: BlurryIcons.warningIcon
};
