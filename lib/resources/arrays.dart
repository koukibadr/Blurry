import 'package:flutter/cupertino.dart';

import 'icons.dart';

enum DEFAULT_THEMES {
  info,
  success,
  error,
  warning,
}

enum LAYOUT_TYPE {
  ltr,
  rtl,
  center,
}

enum TYPE {
  info,
  input,
  singleChoiceSelector,
}

Map<DEFAULT_THEMES, IconData> themesIcons = {
  DEFAULT_THEMES.info: BlurryIcons.infoIcon,
  DEFAULT_THEMES.error: BlurryIcons.errorIcon,
  DEFAULT_THEMES.success: BlurryIcons.successIcon,
  DEFAULT_THEMES.warning: BlurryIcons.warningIcon
};
