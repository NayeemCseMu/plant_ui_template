import 'package:flutter/material.dart';

import 'custom_text_view.dart';

class PlantTitle extends StatelessWidget {
  const PlantTitle({
    super.key,
    required this.title,
    required this.fontS,
  });
  final String title;
  final double fontS;

  @override
  Widget build(BuildContext context) {
    return CustomTextView(
      text: title,
      fontSize: fontS,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.start,
      maxLines: 1,
    );
  }
}
