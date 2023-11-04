import 'package:flutter/material.dart';

import 'custom_text_view.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 16,
      backgroundColor: Colors.black,
      child: Icon(
        Icons.favorite,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

class PlantPrice extends StatelessWidget {
  const PlantPrice({
    super.key,
    required this.price,
  });
  final String price;

  @override
  Widget build(BuildContext context) {
    return CustomTextView(
      text: "\$$price",
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
}
