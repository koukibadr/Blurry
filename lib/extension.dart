import 'package:flutter/cupertino.dart';

extension TextStyleExtension on TextStyle {
  TextStyle clone(Color textColor, FontWeight fontWeightValue) {
    return TextStyle(
        background: background,
        backgroundColor: backgroundColor,
        color: textColor,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeightValue,
        foreground: foreground,
        height: height,
        inherit: inherit,
        leadingDistribution: leadingDistribution,
        letterSpacing: letterSpacing,
        locale: locale,
        overflow: overflow,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing);
  }
}
