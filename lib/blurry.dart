import 'dart:ui';

import 'package:blurry/resources/arrays.dart';
import 'package:blurry/resources/colors.dart';
import 'package:blurry/resources/values.dart';
import 'package:blurry/widgets/blurry_text_field.dart';
import 'package:flutter/material.dart';
import 'package:blurry/resources/extensions.dart';

// ignore: must_be_immutable
class Blurry extends StatefulWidget {
  ///default constructor
  ///to generate customized blurry dialog
  Blurry(
      {Key? key,
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
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    _dialogType = TYPE.info;
    type = null;
  }

  ///info constructor to render info style dialog
  Blurry.info(
      {Key? key,
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
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.info;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
  }

  ///render success style dialog
  Blurry.success(
      {Key? key,
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
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.success;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
  }

  ///render error style dialog
  Blurry.error(
      {Key? key,
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
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.error;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
  }

  ///render warning style dialog
  Blurry.warning(
      {Key? key,
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
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr,
      this.inputLabel,
      this.inputTextController,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black)})
      : super(key: key) {
    type = BLURRY_TYPE.warning;
    icon = themesIcons[type];
    themeColor = null;
    _dialogType = TYPE.info;
  }

  Blurry.input(
      {Key? key,
      required this.title,
      required this.description,
      required this.confirmButtonText,
      required this.onConfirmButtonPressed,
      required this.inputLabel,
      required this.inputTextController,
      this.themeColor,
      this.type,
      this.icon,
      this.inputLabelStyle = const TextStyle(color: Colors.black),
      this.inputTextStyle = const TextStyle(color: Colors.black),
      this.onCancelButtonPressed,
      this.cancelButtonText = 'Cancel',
      this.titleTextStyle,
      this.buttonTextStyle,
      this.descriptionTextStyle,
      this.popupHeight,
      this.displayCancelButton = true,
      this.dismissable = true,
      this.barrierColor,
      this.layoutType = LAYOUT_TYPE.ltr})
      : super(key: key) {
    _dialogType = TYPE.input;
    assert(inputLabel != null && inputTextController != null);
    assert(type != null || themeColor != null);
    if (type != null && themeColor != null) {
      throw Exception('only dialogType or themeColor should be provided');
    }
    if (type == null) {
      assert(icon != null);
    }
  }

  ///the dialog popup title, required in all blurry class constructors
  final String title;

  ///the dialog description text
  ///required in all blurry class constructors
  final String description;

  ///the cancel button text, by default  it's 'Cancel'
  final String cancelButtonText;

  ///the confirm button (primary button) text string
  final String confirmButtonText;

  ///the dialog theme color
  ///will be applied on buttons and icon
  ///not available in default types constructors (info, error, warning, success)
  late Color? themeColor;

  ///function invoked when the primary button is pressed
  ///required in all constructors
  final Function onConfirmButtonPressed;

  ///the callback that will be invoked when pressing on cancel button
  final Function? onCancelButtonPressed;

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
  final bool displayCancelButton;

  ///indicates whether the popup dialog is dismissable or not
  ///by default [dismissable = true]
  final bool dismissable;

  ///the color of the barrier of the burry dialog
  ///if it's null the barrier color will be the default color [Colors.black54]
  final Color? barrierColor;

  //TODO add documentation
  final LAYOUT_TYPE layoutType;

  //TODO add documentation
  late String? inputLabel;

  //TODO add documentation
  late TextEditingController? inputTextController;

  //TODO add documentation
  late TextStyle inputTextStyle;

  //TODO add documentation
  late TextStyle inputLabelStyle;

  //? private values
  late BLURRY_TYPE? type;

  late TYPE? _dialogType;

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
    Color renderingColor = _getRenderingColorTheme();
    return widget._dialogType == TYPE.info
        ? _renderBlurryInfo(renderingColor)
        : _renderBlurryInput(renderingColor);
  }

  Expanded _renderPopupDescription() {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                widget.description,
                textAlign: widget.layoutType == LAYOUT_TYPE.center
                    ? TextAlign.center
                    : widget.layoutType == LAYOUT_TYPE.rtl
                        ? TextAlign.end
                        : TextAlign.start,
                style: widget.descriptionTextStyle ??
                    DefaultBlurryValues.descriptionDefaultStyle,
              ),
            ),
          ),
        ));
  }

  Widget _renderBlurryInput(renderingColor) {
    return Container(
      height: widget.popupHeight ?? MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: DefaultBlurryValues.defaultBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _renderPopupTitle(renderingColor),
          _renderPopupDescription(),
          const SizedBox(
            height: 5,
          ),
          BlurryTextField(
            label: widget.inputLabel!,
            textController: widget.inputTextController!,
            labelStyle: widget.inputLabelStyle,
            textStyle: widget.inputTextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 1,
            child: _renderButtonsLayout(context, renderingColor),
          )
        ],
      ),
    );
  }

  Widget _renderBlurryInfo(renderingColor) {
    return Container(
        height: widget.popupHeight ?? MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        decoration: DefaultBlurryValues.defaultBoxDecoration,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _renderPopupTitle(renderingColor),
          _renderPopupDescription(),
          Expanded(
            flex: 1,
            child: _renderButtonsLayout(context, renderingColor),
          )
        ]));
  }

  Row _renderButtonsLayout(BuildContext context, Color renderingColor) {
    if (widget.layoutType == LAYOUT_TYPE.rtl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              widget.onConfirmButtonPressed.call();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: renderingColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 5,
                    top: 5,
                  ),
                  child: _renderButtonText(
                    widget.confirmButtonText,
                    renderingColor,
                  ),
                )),
          ),
          if (widget.displayCancelButton)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                widget.onCancelButtonPressed?.call();
              },
              child: _renderButtonText(
                widget.cancelButtonText,
                renderingColor,
              ),
            ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (widget.displayCancelButton)
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              widget.onCancelButtonPressed?.call();
            },
            child: _renderButtonText(
              widget.cancelButtonText,
              renderingColor,
            ),
          ),
        GestureDetector(
          onTap: () {
            widget.onConfirmButtonPressed.call();
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: renderingColor.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                  top: 5,
                ),
                child: _renderButtonText(
                  widget.confirmButtonText,
                  renderingColor,
                ),
              )),
        ),
      ],
    );
  }

  Widget _renderPopupTitle(Color renderingColor) {
    Widget titleContent;
    if (widget.layoutType == LAYOUT_TYPE.center) {
      titleContent = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.type.renderingIcon(widget.icon),
              color: renderingColor,
              size: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.title,
                style: widget.titleTextStyle ??
                    DefaultBlurryValues.titleDefaultStyle)
          ],
        ),
      );
    } else if (widget.layoutType == LAYOUT_TYPE.rtl) {
      titleContent = Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: widget.titleTextStyle ??
                  DefaultBlurryValues.titleDefaultStyle,
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              widget.type.renderingIcon(widget.icon),
              color: renderingColor,
              size: 25,
            )
          ],
        ),
      );
    }
    titleContent = Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Icon(
            widget.type.renderingIcon(widget.icon),
            color: renderingColor,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style:
                widget.titleTextStyle ?? DefaultBlurryValues.titleDefaultStyle,
          )
        ],
      ),
    );
    return Expanded(
      flex: 1,
      child: titleContent,
    );
  }

  Text _renderButtonText(String text, Color textColor) {
    return Text(text,
        style: widget.buttonTextStyle == null
            ? TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              )
            : widget.buttonTextStyle!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
        textAlign: widget.layoutType == LAYOUT_TYPE.center
            ? TextAlign.center
            : widget.layoutType == LAYOUT_TYPE.rtl
                ? TextAlign.end
                : TextAlign.start);
  }

  Color _getRenderingColorTheme() {
    if (widget.themeColor != null) {
      return widget.themeColor!;
    } else {
      switch (widget.type) {
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
