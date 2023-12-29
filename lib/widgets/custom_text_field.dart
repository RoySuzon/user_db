import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? sufixIcon, prefixIcon;
  final String? Function(String? value)? validator;
  final bool? obscureText;
  final TextInputType? inputType;
  final Function(String? value)? onChange;
  // final T

  CustomeTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.sufixIcon,
    this.validator,
    this.prefixIcon,
    this.obscureText,
    this.inputType,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        style: TextStyle(color: Color(0xff33186B)),

        cursorHeight: 10,
        obscureText: obscureText ?? false,
        validator: validator,
        keyboardType: inputType,

        onChanged: onChange,
        // selectionHeightStyle: ui.BoxHeightStyle.tight,
        // keyboardAppearance: Brightness.dark,
        // autofocus: true,
        // onChanged: (value) {
        //   keys != null ? keys!.currentState!.validate() : null;
        // },
        obscuringCharacter: "?",
        decoration: InputDecoration(
          filled: true, fillColor: Colors.deepPurple.withOpacity(.1),
          hintStyle: TextStyle(color: Color(0xff33186B)),
          // errorStyle: TextStyle(color: Colors.pink),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
          suffixIcon: sufixIcon != null ? Icon(sufixIcon) : null,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        ),
        // expands: false
        // ,

        // minLines: 1,
        // maxLength: 12,
        // maxLines: 5,
        // magnifierConfiguration: TextMagnifierConfiguration.disabled,
        controller: controller,
        autocorrect: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // autofillHints: ['Gouto'],
        // autocorrect: true,
      ),
    );
  }
}
