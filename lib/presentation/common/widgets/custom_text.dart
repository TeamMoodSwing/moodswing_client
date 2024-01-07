import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/style/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final double? fontSize;
  final Color? color;
  const CustomText(
      {required this.text, this.padding, this.fontSize, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(4),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: fontSize ?? 14,
            color: color ?? LightMode.TEXT_COLOR),
      ),
    );
  }
}
