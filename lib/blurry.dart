import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/colors.dart';
import 'package:blurry/resources/values.dart';
import 'package:blurry/widgets/blurry_info_popup.dart';
import 'package:blurry/widgets/blurry_input_popup.dart';
import 'package:blurry/widgets/blurry_single_choice_selector.dart';
import 'package:flutter/material.dart';
import 'package:blurry/resources/extensions.dart';

// ignore: must_be_immutable
class Blurry extends StatefulWidget {
  ///default constructor
  ///to generate customized blurry dialog
  Blurry({
    Key? key,
    required this.title,
    required this.description,
    required this.themeColor,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    required this.icon,
    this.cancelButtonText = 'Cancel',
    this.onCancelButtonPressed,
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
    this.inputLabel,
    this.inputTextController,
  }) : super(key: key) {
    _dialogType = TYPE.info;
    defaultTheme = null;
    items = null;
    onItemSelected = null;
  }

  ///info constructor to render info style dialog
  Blurry.info({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
    this.inputLabel,
    this.inputTextController,
  }) : super(key: key) {
    defaultTheme = DEFAULT_THEMES.info;
    icon = themesIcons[defaultTheme];
    themeColor = null;
    _dialogType = TYPE.info;
    items = null;
    onItemSelected = null;
  }

  ///render success style dialog
  Blurry.success({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
    this.inputLabel,
    this.inputTextController,
  }) : super(key: key) {
    defaultTheme = DEFAULT_THEMES.success;
    icon = themesIcons[defaultTheme];
    themeColor = null;
    _dialogType = TYPE.info;
    items = null;
    onItemSelected = null;
  }

  ///render error style dialog
  Blurry.error({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
    this.inputLabel,
    this.inputTextController,
  }) : super(key: key) {
    defaultTheme = DEFAULT_THEMES.error;
    icon = themesIcons[defaultTheme];
    themeColor = null;
    _dialogType = TYPE.info;
    items = null;
    onItemSelected = null;
  }

  ///render warning style dialog
  Blurry.warning({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
  }) : super(key: key) {
    defaultTheme = DEFAULT_THEMES.warning;
    icon = themesIcons[defaultTheme];
    themeColor = null;
    _dialogType = TYPE.info;
    items = null;
    onItemSelected = null;
  }

  /// to create input blurry popup provide the required values
  /// provide either themeColor or type
  /// when providing themeColor you should provide icon value
  Blurry.input({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    required this.inputLabel,
    required this.inputTextController,
    this.textInputType = TextInputType.text,
    this.themeColor,
    this.defaultTheme,
    this.icon,
    this.inputLabelStyle = DefaultBlurryValues.defaultInputTextStyle,
    this.inputTextStyle = DefaultBlurryValues.defaultInputTextStyle,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
  }) : super(key: key) {
    
    _dialogType = TYPE.input;
    initializeValuesInputBlurry();
  }

  /// to create input blurry popup provide the required values
  /// provide either themeColor or type
  /// when providing themeColor you should provide icon value
  Blurry.password({
    Key? key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.onConfirmButtonPressed,
    required this.inputLabel,
    required this.inputTextController,
    this.textInputType = TextInputType.text,
    this.themeColor,
    this.defaultTheme,
    this.icon,
    this.inputLabelStyle = DefaultBlurryValues.defaultInputTextStyle,
    this.inputTextStyle = DefaultBlurryValues.defaultInputTextStyle,
    this.onCancelButtonPressed,
    this.cancelButtonText = 'Cancel',
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
    this.withVisibilityEye = DefaultBlurryValues.defaultVisibilityEyeValue,
  }) : super(key: key) {
    
    
    _dialogType = TYPE.input;
    initializeValuesInputBlurry(
      passwordField: true,
    );
  }

  /// to create input blurry popup provide the required values
  /// provide either themeColor or type
  /// when providing themeColor you should provide icon value
  Blurry.singleChoiceSelector({
    Key? key,
    required this.title,
    required this.description,
    required this.items,
    required this.onItemSelected,
    this.textInputType = TextInputType.text,
    this.themeColor,
    this.defaultTheme,
    this.icon,
    this.titleTextStyle,
    this.buttonTextStyle,
    this.descriptionTextStyle,
    this.popupHeight,
    this.dismissable = DefaultBlurryValues.defaultDismissableValue,
    this.barrierColor,
    this.layoutType = LAYOUT_TYPE.ltr,
  }) : super(key: key) {
    _dialogType = TYPE.singleChoiceSelector;
    
    inputLabel = null;
    inputTextController = null;
    onConfirmButtonPressed = null;
    onCancelButtonPressed = null;
    displayCancelButton =
        DefaultBlurryValues.defaultDisplayCancelButtonState;
    
    assert(defaultTheme != null || (themeColor != null && icon != null));
    assert(items != null && items!.isNotEmpty);
    assert(onItemSelected != null);
  }



  ///the dialog popup title, required in all blurry class constructors
  final String title;

  ///the dialog description text
  ///required in all blurry class constructors
  final String description;

  ///the cancel button text, by default  it's 'Cancel'
  late String cancelButtonText = '';

  ///the confirm button (primary button) text string
  late String confirmButtonText = '';

  ///the dialog theme color
  ///will be applied on buttons and icon
  ///not available in default types constructors (info, error, warning, success)
  late Color? themeColor;

  ///function invoked when the primary button is pressed
  ///required in all constructors
  late Function? onConfirmButtonPressed;

  ///the callback that will be invoked when pressing on cancel button
  late Function? onCancelButtonPressed;

  ///the icon that will be rendered in the dialog
  ///required only when using the default constructor
  late IconData? icon;

  ///title text style, by default it's null
  final TextStyle? titleTextStyle;

  ///description text style, by default it's null
  final TextStyle? descriptionTextStyle;

  ///button text style, by default it's null
  final TextStyle? buttonTextStyle;

  ///the blurry dialog popup height
  final double? popupHeight;

  ///indicate whether the cancel button will be rendered or not
  ///by default the cancel button is displayed
  late bool displayCancelButton;

  ///indicates whether the popup dialog is dismissable or not
  ///by default [dismissable = true]
  final bool dismissable;

  ///the color of the barrier of the burry dialog
  ///if it's null the barrier color will be the default color [Colors.black54]
  final Color? barrierColor;

  ///the layout rendering type, LTR, RTL or center
  ///possible values
  /// - ltr
  /// - rtl
  /// - center
  /// by default is [LAYOUT_TYPE.ltr]
  final LAYOUT_TYPE layoutType;

  /// the input label string, required when using the input constructor
  late String? inputLabel;

  /// the input text field text controller
  /// required when using the input constructor
  late TextEditingController? inputTextController;

  /// the input text style by default it's just black text
  late TextStyle inputTextStyle;

  /// the input label style by default it's just black text
  late TextStyle inputLabelStyle;

  /// text input type applied on input field
  /// available only when using the input constructor
  late TextInputType textInputType;

  /// the design type of the popup, available when using input constructor
  /// availabele options
  /// ```dart
  /// {
  /// info,
  /// success,
  /// error,
  /// warning
  /// }
  /// ```
  late DEFAULT_THEMES? defaultTheme;

  /// indicate whether display visibility eye icon on password fields
  /// available only when using `Blurry.password` constructor
  /// by default it's 'true'
  bool withVisibilityEye = true;

  late List<Widget>? items;

  late Function(int)? onItemSelected;

  late TYPE? _dialogType;

  bool isPasswordField = false;

  ///display the rendered dialog content
  ///in alert dialog
  ///
  ///[context]: the context of the app to display the dialog
  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: dismissable,
      barrierColor: barrierColor ?? BlurryColors.defaultBarrierColor,
      builder: (context) {
        return AlertDialog(
          content: this,
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.white.withOpacity(0),
        );
      },
    );
  }

  @override
  State<Blurry> createState() => _BlurryState();
}

class _BlurryState extends State<Blurry> {
  @override
  Widget build(BuildContext context) {
    switch (widget._dialogType) {
      case TYPE.singleChoiceSelector:
        return BlurrySingleChoiceSelector(
            popupHeight: widget.popupHeight,
            blurryType: widget.defaultTheme,
            icon: widget.icon,
            layoutType: widget.layoutType,
            renderingColor: widget.defaultTheme.renderingColor(widget.themeColor),
            titleTextStyle: widget.titleTextStyle,
            title: widget.title,
            description: widget.description,
            descriptionTextStyle: widget.descriptionTextStyle,
            buttonTextStyle: widget.buttonTextStyle,
            listItems: widget.items!,
            onItemSelected: widget.onItemSelected!,
          );
      case TYPE.input:
        return BlurryInputPopup(
            popupHeight: widget.popupHeight,
            blurryType: widget.defaultTheme,
            icon: widget.icon,
            layoutType: widget.layoutType,
            renderingColor: widget.defaultTheme.renderingColor(widget.themeColor),
            titleTextStyle: widget.titleTextStyle,
            title: widget.title,
            description: widget.description,
            descriptionTextStyle: widget.descriptionTextStyle,
            inputLabel: widget.inputLabel!,
            inputLabelStyle: widget.inputLabelStyle,
            inputTextStyle: widget.inputTextStyle,
            textInputType: widget.textInputType,
            textEditingController: widget.inputTextController!,
            buttonTextStyle: widget.buttonTextStyle,
            cancelButtonText: widget.cancelButtonText,
            confirmButtonText: widget.confirmButtonText,
            displayCancelButton: widget.displayCancelButton,
            isPassword: widget.isPasswordField,
            withVisibityEye: widget.withVisibilityEye,
            onCancelPressed: () {
              Navigator.pop(context);
              widget.onCancelButtonPressed?.call();
            },
            onConfirmPressed: () {
              widget.onConfirmButtonPressed?.call();
            },
          );
      default:
        return BlurryInfoPopup(
            popupHeight: widget.popupHeight,
            blurryType: widget.defaultTheme,
            icon: widget.icon,
            layoutType: widget.layoutType,
            renderingColor: widget.defaultTheme.renderingColor(widget.themeColor),
            titleTextStyle: widget.titleTextStyle,
            title: widget.title,
            description: widget.description,
            descriptionTextStyle: widget.descriptionTextStyle,
            buttonTextStyle: widget.buttonTextStyle,
            cancelButtonText: widget.cancelButtonText,
            confirmButtonText: widget.confirmButtonText,
            displayCancelButton: widget.displayCancelButton,
            onCancelPressed: () {
              Navigator.pop(context);
              widget.onCancelButtonPressed?.call();
            },
            onConfirmPressed: () {
              widget.onConfirmButtonPressed?.call();
            },
          );
    }
  }
}
