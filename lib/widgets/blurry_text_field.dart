import 'package:flutter/material.dart';

class BlurryTextField extends StatelessWidget {
  final String label;
  final TextStyle textStyle;
  final TextStyle labelStyle;

  const BlurryTextField(
      {Key? key,
      required this.label,
      this.textStyle = const TextStyle(color: Colors.black),
      this.labelStyle = const TextStyle(color: Colors.black)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 50,
      child: TextFormField(
        style: textStyle,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: labelStyle.copyWith(fontSize: 12),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
