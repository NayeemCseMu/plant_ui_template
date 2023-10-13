import 'package:flutter/material.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/core/utils/k_images.dart';
import 'package:plant_ui_app/widgets/custom_image_view.dart';

import '../../core/utils/utils.dart';
import '../../widgets/custom_text_view.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({super.key, required this.i});
  final int i;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.shopping_cart_outlined),
          Utils.horizontalSpace(16)
        ],
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: size.height * 0.4,
            child: Hero(
              tag: i,
              child: CustomImageView(
                imagePath: KImages.plantImgOne,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Utils.verticalSpace(16),
                const CustomTextView(
                  text: "Lorem Ipsum",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
                Utils.verticalSpace(20),
                const CustomTextView(
                  text:
                      "Plants make your life minimal and happy love plants more and enjoy your life.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: kLightTextColor,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomSheet: Container(
        height: 260,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      3,
                      (index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.height,
                                color: Colors.white,
                              ),
                              Utils.verticalSpace(10),
                              const CustomTextView(
                                text: "Height",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              const CustomTextView(
                                text: "30cm - 40",
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ],
                          ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        text: "Total Price",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomTextView(
                        text: "\$12.99",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        color: kDefaultIconDarkColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: const CustomTextView(
                      text: "Add to Cart",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
