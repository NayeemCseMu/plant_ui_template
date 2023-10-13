// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/constants.dart';

class CustomTextView extends StatelessWidget {
  ///[text] is required parameter for display text
  final String text;

  ///[fontSize] is parameter for give a text size
  final double fontSize;

  ///[fontWeight] is parameter for weighting text
  final FontWeight fontWeight;

  ///[color] is  parameter for coloring the text
  final Color color;

  ///[fontStyle] is  parameter
  final FontStyle fontStyle;

  ///[textAlign] is  parameter
  final TextAlign textAlign;

  ///[maxLines] is  parameter
  final int? maxLines;

  const CustomTextView({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.color = kTextColor,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
      ),
    );
  }
}
