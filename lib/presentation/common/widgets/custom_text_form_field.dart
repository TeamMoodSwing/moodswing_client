import 'package:flutter/material.dart';
//import 'package:actual_flutter/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final bool autofocus;
  final bool showSufixIcon;
  final Function(String) onChanged;
  final TextEditingController? textEditinContorller;
  final String? hintText;
  final String? errorText;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.autofocus = false,
    this.showSufixIcon = false,
    required this.onChanged,
    this.textEditinContorller,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        // color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // cursorColor: PRIMARY_COLOR,
        obscureText: obscureText,
        controller: textEditinContorller,
        autofocus: autofocus,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
          hintStyle: const TextStyle(
            // color: BODY_TEXT_COLOR,
            fontSize: 14,
          ),
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: showSufixIcon ? Icon(Icons.check) : null,
          // fillColor: INPUT_BG_COLOR,
          filled: false,
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
                // color: PRIMARY_COLOR,
                ),
          ),
        ),
      ),
    );
  }
}
