import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/style/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;
  final bool isBold;
  final Color? color;
  const CustomText(
      {required this.text,
      this.padding,
      this.margin,
      this.alignment,
      this.fontSize,
      this.isBold = false,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: fontSize ?? 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color ?? LightMode.TEXT_COLOR),
      ),
    );
  }
}
