import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget? child;
  const CustomTextButton({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(alignment: Alignment.center),
      child: child ?? Text(''),
    );
  }
}
