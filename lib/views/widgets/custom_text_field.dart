import 'package:flutter/material.dart';

import 'package:note_app/constant.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is required';
          } else {
            return null;
          }
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hint,
          // ignore: prefer_const_constructors
          hintStyle: TextStyle(
            color: kPrimaryColor,
          ),
          border: bulidBorder(),
          enabledBorder: bulidBorder(),
          focusedBorder: bulidBorder(
            kPrimaryColor,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder bulidBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
