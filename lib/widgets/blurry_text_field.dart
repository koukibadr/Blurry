import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurryTextField extends StatefulWidget {
  final String label;
  final TextStyle textStyle;
  final TextStyle labelStyle;
  final TextEditingController textController;
  final Color themeColor;
  final TextInputType textInputType;
  final bool isPassword;
  final bool withVisibilityEye;

  const BlurryTextField({
    Key? key,
    required this.label,
    required this.textController,
    required this.themeColor,
    required this.textInputType,
    required this.isPassword,
    required this.withVisibilityEye,
    this.textStyle = const TextStyle(color: Colors.black),
    this.labelStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);

  @override
  State<BlurryTextField> createState() => _BlurryTextFieldState();
}

class _BlurryTextFieldState extends State<BlurryTextField> {
  late bool obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        style: widget.textStyle,
        keyboardType: widget.textInputType,
        obscureText: obscureText,
        controller: widget.textController,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: widget.labelStyle.copyWith(fontSize: 12),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: widget.themeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          suffix: widget.isPassword && widget.withVisibilityEye
              ? InkWell(
                  onTap: _changePasswordVisibility,
                  child: obscureText
                      ? Icon(
                          CupertinoIcons.eye,
                          color: widget.themeColor,
                        )
                      : Icon(
                          CupertinoIcons.eye_slash,
                          color: widget.themeColor,
                        ),
                )
              : null,
        ),
      ),
    );
  }

  void _changePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
