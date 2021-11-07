import 'package:flutter/cupertino.dart';

import 'icons.dart';

enum BLURRY_TYPE { info, success, error, warning }

enum LAYOUT_TYPE { ltr, rtl, center }

enum TYPE { info, input }

Map<BLURRY_TYPE, IconData> themesIcons = {
  BLURRY_TYPE.info:BlurryIcons.infoIcon,
  BLURRY_TYPE.error: BlurryIcons.errorIcon,
  BLURRY_TYPE.success: BlurryIcons.successIcon,
  BLURRY_TYPE.warning: BlurryIcons.warningIcon
};