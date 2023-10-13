import 'package:flutter/material.dart';
import '../core/utils/k_images.dart';
import '../core/utils/utils.dart';

List<String> images = [
  KImages.plantImgOne,
  KImages.plantImgTwo,
  KImages.plantImgThree,
  KImages.plantImgTwo,
  KImages.plantImgOne,
  
];

class SliderOnboard extends StatefulWidget {
  const SliderOnboard({super.key, required this.controller});
  final PageController controller;

  @override
  State<SliderOnboard> createState() => _SliderOnboardState();
}

class _SliderOnboardState extends State<SliderOnboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Utils.verticalSpace(16),
      ],
    );
  }
}
